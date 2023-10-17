json.extract! buyer, :id, :b_id, :b_name, :b_dob, :created_at, :updated_at
json.url buyer_url(buyer, format: :json)
