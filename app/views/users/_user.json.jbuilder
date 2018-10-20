json.extract! user, :id, :name, :name_kana, :created_at, :updated_at
json.url user_url(user, format: :json)
