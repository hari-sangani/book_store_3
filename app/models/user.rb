class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_one :cart, dependent: :destroy
  has_one :wishlist, dependent: :destroy

  validates :name, :email, :contact_no,:address, :username, presence: true
  validates :email, :username, uniqueness: { message: 'Already Exist! Try another one!!' }
end
