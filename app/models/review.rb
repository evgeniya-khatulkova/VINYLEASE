class Review < ApplicationRecord
  validates :rating, :content, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than: 6 }
  validates :comment, length: { minimum: 6 }
  belongs_to :reservation
end
