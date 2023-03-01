class AddReferenceToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :reservation, index: true
    add_foreign_key :reviews, :reservations
  end
end
