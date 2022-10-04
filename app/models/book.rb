class Book < ApplicationRecord
  belongs_to :publisher
  has_many :carts
  has_many :wishlists
  has_many :order_books
  has_many :orders, through: :order_books
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :categories

  validates :publisher_id, :title, :isbndb, :publish_date, :language, :quantity, presence: true
  validates :isbndb, uniqueness: { message: 'Already exist!' }
end
