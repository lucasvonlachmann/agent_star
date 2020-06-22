class RemoveKpiFromRootCause < ActiveRecord::Migration[5.2]
  def change
    remove_reference :root_causes, :kpi, foreign_key: true
  end
end
