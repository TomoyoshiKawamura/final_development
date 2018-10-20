json.extract! item, :id, :title, :price, :company, :explanation, :created_at, :updated_at
json.url item_url(item, format: :json)
