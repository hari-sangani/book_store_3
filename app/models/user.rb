class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :destroy
  has_one :cart, dependent: :destroy
  has_one :wishlist, dependent: :destroy

  validates :name, :email, :contact_no, :address, :username, presence: true
  validates :email, :username, uniqueness: { message: 'Already Exist! Try another one!!' }
end
