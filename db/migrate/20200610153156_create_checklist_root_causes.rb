class CreateChecklistRootCauses < ActiveRecord::Migration[5.2]
  def change
    create_table :checklist_root_causes do |t|
      t.references :checklist, foreign_key: true
      t.references :root_cause, foreign_key: true

      t.timestamps
    end
  end
end
