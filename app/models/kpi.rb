class Kpi < ApplicationRecord
  belongs_to :carrier
  belongs_to :port
  belongs_to :kpi_type
  has_many :root_causes, through: :kpi_type
  # has_many :checklist_root_causes, through: :root_causes
  # has_many :checklists, through: :checklist_root_causes
end
