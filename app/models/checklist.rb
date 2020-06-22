class Checklist < ApplicationRecord
  audited

  COLUMNS_TO_FILL = 13

  include PgSearch::Model
  multisearchable against: [:draft_arrival, :tugs_arrival, :eosp, :pob_arrival, :berthed, :gangway_ready, :started_ops, :completed_ops, :terminal_requested, :pob_departure, :last_line, :draft_departure, :tugs_departure, :remarks]

  belongs_to :scale
  has_many :checklist_root_causes
  has_many :root_causes, through: :checklist_root_causes

  def progress
    (100 - ((attributes.values.select(&:nil?).count * 100) / COLUMNS_TO_FILL)).to_s + "%"
  end
end
