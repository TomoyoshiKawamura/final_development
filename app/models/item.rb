class Item < ApplicationRecord
    has_many :item_images
    has_many :reviews
    has_many :cart_items
    has_many :carts, through: :cart_items
end
