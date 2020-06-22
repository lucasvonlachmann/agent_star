class VwChecklist < ActiveRecord::Base
  def readonly?
    true
  end

  belongs_to :scale

  def kpis
    Kpi.where(carrier_id: carrier_id, port_id: port_id)
  end

  def unmet_kpis
    ary = []
    kpis.each do |kpi|
      if self.read_attribute("#{kpi.kpi_type.vw_name}").present?
        ary << kpi if self.read_attribute("#{kpi.kpi_type.vw_name}") > kpi.target
      end
    end
    ary
  end
end
