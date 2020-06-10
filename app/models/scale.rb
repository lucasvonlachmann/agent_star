class Scale < ApplicationRecord
  belongs_to :vessel
  belongs_to :carrier
  has_one :checklist
end
