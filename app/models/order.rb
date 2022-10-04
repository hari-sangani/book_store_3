class Order < ApplicationRecord
  belongs_to :user
  has_many :order_books
  has_many :books, through: :order_books

  validates :user_id, :date, :status, presence: true
end
