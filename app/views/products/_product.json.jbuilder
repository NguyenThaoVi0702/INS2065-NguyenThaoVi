json.extract! product, :id, :brand_id, :name, :image, :price, :discount, :description, :available, :created_at, :updated_at
json.url product_url(product, format: :json)
