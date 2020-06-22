class UpdateVwChecklistsToVersion2 < ActiveRecord::Migration[5.2]
  def change
    update_view :vw_checklists, version: 2, revert_to_version: 1
  end
end
