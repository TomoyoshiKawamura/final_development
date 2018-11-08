class Cart < ApplicationRecord
    belongs_to :user
    has_many :cart_items #丸々抜けてた
    has_many :items, through: :cart_items #sが抜けてた
end
