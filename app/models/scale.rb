class Scale < ApplicationRecord
  audited

  belongs_to :vessel
  belongs_to :carrier
  belongs_to :port
  has_one :checklist
end
