class CreateScales < ActiveRecord::Migration[5.2]
  def change
    create_table :scales do |t|
      t.references :vessel, foreign_key: true
      t.references :carrier, foreign_key: true
      t.string :voyage
      t.string :service

      t.timestamps
    end
  end
end
