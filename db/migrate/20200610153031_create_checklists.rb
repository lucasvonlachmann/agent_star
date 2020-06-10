class CreateChecklists < ActiveRecord::Migration[5.2]
  def change
    create_table :checklists do |t|
      t.references :scale, foreign_key: true
      t.integer :draft_arrival
      t.integer :tugs_arrival
      t.datetime :eosp
      t.datetime :pob_arrival
      t.datetime :berthed
      t.datetime :gangway_ready
      t.datetime :started_ops
      t.datetime :completed_ops
      t.datetime :terminal_requested
      t.datetime :pob_departure
      t.datetime :last_line
      t.integer :draft_departure
      t.integer :tugs_departure

      t.timestamps
    end
  end
end
