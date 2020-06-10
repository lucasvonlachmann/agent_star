class CreateKpis < ActiveRecord::Migration[5.2]
  def change
    create_table :kpis do |t|
      t.references :carrier, foreign_key: true
      t.string :name
      t.integer :taget
      t.integer :max_limit
      t.integer :min_limit

      t.timestamps
    end
  end
end
