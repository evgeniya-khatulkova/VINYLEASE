GENRES = ["Rock", "Jazz", "Electronic", "Pop", "Hip-hop", "Funk", "Soul", "Disco"]

class Record < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations
  # belongs_to :user

  validates :title, presence: true
  validates :genre, presence: true, inclusion: { in: GENRES }
  validates :price, presence: true, numericality: true
  validates :location, presence: true
  validates :artist, presence: true
end
