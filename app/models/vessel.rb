class Vessel < ApplicationRecord
  has_many :scales
  has_many :checklist, through: :scales
end
