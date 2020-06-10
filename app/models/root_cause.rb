class RootCause < ApplicationRecord
  belongs_to :kpi
  has_many :checklist_root_causes
  has_many :checklists, through: :checklist_root_causes
end
