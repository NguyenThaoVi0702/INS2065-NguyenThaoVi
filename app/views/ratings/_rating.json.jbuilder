json.extract! rating, :id, :user_id, :product_id, :stars_rated, :created_at, :updated_at
json.url rating_url(rating, format: :json)
