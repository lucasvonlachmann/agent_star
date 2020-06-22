class AddKpiTypeToKpi < ActiveRecord::Migration[5.2]
  def change
    add_reference :kpis, :kpi_type, foreign_key: true
  end
end
