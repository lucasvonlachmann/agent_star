class ChangeColumnNameOnKpi < ActiveRecord::Migration[5.2]
  def change
    rename_column :kpis, :taget, :target
  end
end
