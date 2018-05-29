json.extract! client, :id, :user_id, :alias, :rfc, :razon_social, :direccion, :planta, :codigo_empresa, :codigo_planta, :numero_proveedor, :created_at, :updated_at
json.url client_url(client, format: :json)
