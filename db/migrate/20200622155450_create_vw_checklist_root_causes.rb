class CreateVwChecklistRootCauses < ActiveRecord::Migration[5.2]
  def change
    create_view :vw_checklist_root_causes
  end
end
