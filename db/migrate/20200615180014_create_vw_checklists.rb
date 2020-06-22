class CreateVwChecklists < ActiveRecord::Migration[5.2]
  def change
    create_view :vw_checklists
  end
end
