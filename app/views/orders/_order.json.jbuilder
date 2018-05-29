json.extract! order, :id, :user_id, :client_id, :product_id, :numero_de_orden, :fecha_de_orden, :nombre_encargado, :cantidad, :descripcion, :precio_unitario, :valor_total, :created_at, :updated_at
json.url order_url(order, format: :json)
