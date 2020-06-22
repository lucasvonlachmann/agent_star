class AddVwNameToKpiType < ActiveRecord::Migration[5.2]
  def change
    add_column :kpi_types, :vw_name, :string
  end
end
