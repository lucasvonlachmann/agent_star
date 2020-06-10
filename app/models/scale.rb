class Scale < ApplicationRecord
  belongs_to :vessel
  belongs_to :carrier
  belongs_to :port
  has_one :checklist
end
