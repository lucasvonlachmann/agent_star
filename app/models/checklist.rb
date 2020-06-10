class Checklist < ApplicationRecord
  belongs_to :scale
  has_many :checklist_root_causes
  has_many :root_causes, through: :checklist_root_causes
end
