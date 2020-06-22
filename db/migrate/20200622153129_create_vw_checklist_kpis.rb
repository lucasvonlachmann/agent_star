class CreateVwChecklistKpis < ActiveRecord::Migration[5.2]
  def change
    create_view :vw_checklist_kpis
  end
end
