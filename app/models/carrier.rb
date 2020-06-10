class Carrier < ApplicationRecord
  has_many :scales
  has_many :checklist, through: :scales
  has_many :kpis
  has_many :root_causes, through: :kpis
end
