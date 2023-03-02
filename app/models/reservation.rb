class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :record
  # Only destroy when deleted via records
  has_many :reviews #, dependent: :destroy
  
end
