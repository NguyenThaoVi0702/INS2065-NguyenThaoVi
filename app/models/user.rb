class User < ApplicationRecord
  has_person_name
  has_many :ratings
  has_many :comments
  has_one :cart

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :create_cart
  private

  def create_cart
    Cart.create(user: self)
  end
end
