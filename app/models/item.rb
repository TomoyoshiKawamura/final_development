class Item < ApplicationRecord
    has_many :cart, through: :cart_items
    has_many :item_images
    has_many :reviews
end
