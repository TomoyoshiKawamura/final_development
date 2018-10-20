json.extract! item_image, :id, :image, :item_id, :created_at, :updated_at
json.url item_image_url(item_image, format: :json)
