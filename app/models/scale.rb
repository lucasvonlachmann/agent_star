class Scale < ApplicationRecord
  audited

  include PgSearch::Model
  multisearchable against: [:voyage, :service]

  belongs_to :vessel
  belongs_to :carrier
  belongs_to :port
  has_one :checklist
  has_one :vw_checklist

  def kpis
    Kpi.where(carrier_id: carrier_id, port_id: port_id)
  end

  def unmet_kpis
    ary = []
    kpis.each do |kpi|
      if self.read_attribute("#{kpi.kpi_type.vw_name}")
        if self.read_attribute("#{kpi.kpi_type.vw_name}") < (kpi.target - kpi.min_limit) || self.read_attribute("#{kpi.kpi_type.vw_name}") > (kpi.target + kpi.max_limit)
          byebug
          ary << kpi
        end
      end
    end
    ary
  end

  def name
    service + " / " + voyage
  end
end
