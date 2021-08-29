json.extract! camp_request, :id, :status, :quantity, :relief_camps_id, :items_id, :collection_centers_id, :created_at, :updated_at
json.url camp_request_url(camp_request, format: :json)
