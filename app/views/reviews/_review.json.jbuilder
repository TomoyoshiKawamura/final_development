json.extract! review, :id, :text, :title, :rank, :user_id, :item_id, :created_at, :updated_at
json.url review_url(review, format: :json)
