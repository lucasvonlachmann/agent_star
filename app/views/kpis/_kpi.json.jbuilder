json.extract! kpi, :id, :carrier_id, :name, :target, :max_limit, :min_limit, :created_at, :updated_at
json.url kpi_url(kpi, format: :json)
