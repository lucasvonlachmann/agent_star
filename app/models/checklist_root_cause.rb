class ChecklistRootCause < ApplicationRecord
  belongs_to :checklist
  belongs_to :root_cause
end
