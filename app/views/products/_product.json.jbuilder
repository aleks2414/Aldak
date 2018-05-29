json.extract! product, :id, :user_id, :nombre, :codigo_producto, :caracteristicas, :created_at, :updated_at
json.url product_url(product, format: :json)
