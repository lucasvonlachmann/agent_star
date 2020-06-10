json.extract! checklist, :id, :scale_id, :draft_arrival, :tugs_arrival, :eosp, :pob_arrival, :berthed, :gangway_ready, :started_ops, :completed_ops, :terminal_requested, :pob_departure, :last_line, :draft_departure, :tugs_departure, :created_at, :updated_at
json.url checklist_url(checklist, format: :json)
