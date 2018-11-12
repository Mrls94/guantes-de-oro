json.extract! bill, :id, :currency_id, :cashier_id, :name, :value, :quantity, :created_at, :updated_at
json.url bill_url(bill, format: :json)
