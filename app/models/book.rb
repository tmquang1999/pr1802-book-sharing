class Book < ApplicationRecord
  belongs_to :user
  belongs_to :author
  has_one :source, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :categories, through: :book_categories
end
