class Item < ApplicationRecord
    has_many :cart, through: :cart_items
end
