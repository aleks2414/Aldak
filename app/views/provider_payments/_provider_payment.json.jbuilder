json.extract! provider_payment, :id, :provider_id, :cantidad, :fecha, :created_at, :updated_at
json.url provider_payment_url(provider_payment, format: :json)
