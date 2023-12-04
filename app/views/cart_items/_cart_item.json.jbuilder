json.extract! cart_item, :id, :product_id, :cart_id, :quantity, :line_total, :created_at, :updated_at
json.url cart_item_url(cart_item, format: :json)
