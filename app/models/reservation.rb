class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :record
  has_many :reviews, dependent: :destroy
end
