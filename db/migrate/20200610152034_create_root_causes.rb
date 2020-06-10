class CreateRootCauses < ActiveRecord::Migration[5.2]
  def change
    create_table :root_causes do |t|
      t.references :kpi, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
