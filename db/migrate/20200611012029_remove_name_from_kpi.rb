class RemoveNameFromKpi < ActiveRecord::Migration[5.2]
  def change
    remove_column :kpis, :name, :string
  end
end
