class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :personal_information
  has_many :credit_cards
  has_one :cart
  after_create :create_cart

  def create_cart
    Cart.create(user_id: self.id)
  end
end
