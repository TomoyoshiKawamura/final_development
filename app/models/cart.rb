class Cart < ApplicationRecord
    belongs_to :user
    has_many :item, through: :cart_items
end
