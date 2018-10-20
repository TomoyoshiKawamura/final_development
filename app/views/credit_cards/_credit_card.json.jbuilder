json.extract! credit_card, :id, :name, :number, :deadline_month, :deadline_year, :user_id, :created_at, :updated_at
json.url credit_card_url(credit_card, format: :json)
