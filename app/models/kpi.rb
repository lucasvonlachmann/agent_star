class Kpi < ApplicationRecord
  belongs_to :carrier
  has_many :root_causes
end
