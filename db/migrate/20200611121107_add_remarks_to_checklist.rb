class AddRemarksToChecklist < ActiveRecord::Migration[5.2]
  def change
    add_column :checklists, :remarks, :string
  end
end
