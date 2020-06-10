json.extract! transaction_entry, :id, :user_id, :transaction_type, :amount, :category_id, :transaction_date, :created_at, :updated_at
json.url transaction_entry_url(transaction_entry, format: :json)
