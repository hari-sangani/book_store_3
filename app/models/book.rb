class Book < ApplicationRecord
  belongs_to :publisher
  has_many :carts
  has_many :wishlists
  has_many :orders_books
  has_many :orders, through: :orders_books
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :categories
  has_one_attached :image

  validates :publisher_id, :title, :isbndb, :publish_date, :language, :quantity, presence: true
  validates :isbndb, uniqueness: { message: 'Already exist!' }
end
