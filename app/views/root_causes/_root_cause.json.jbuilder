json.extract! root_cause, :id, :kpi_id, :name, :description, :created_at, :updated_at
json.url root_cause_url(root_cause, format: :json)
