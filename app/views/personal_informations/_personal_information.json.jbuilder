json.extract! personal_information, :id, :name, :post_code, :address1, :address2, :phone_number, :user_id, :created_at, :updated_at
json.url personal_information_url(personal_information, format: :json)
