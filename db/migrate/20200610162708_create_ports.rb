class CreatePorts < ActiveRecord::Migration[5.2]
  def change
    create_table :ports do |t|
      t.string :name

      t.timestamps
    end
  end
end
