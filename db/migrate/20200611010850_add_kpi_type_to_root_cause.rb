class AddKpiTypeToRootCause < ActiveRecord::Migration[5.2]
  def change
    add_reference :root_causes, :kpi_type, foreign_key: true
  end
end
