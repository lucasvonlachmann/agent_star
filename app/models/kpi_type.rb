class KpiType < ApplicationRecord
  has_many :kpis
  has_many :root_causes
  has_many :checklist_root_causes, through: :root_causes
  has_many :checklists, through: :checklist_root_causes
end
