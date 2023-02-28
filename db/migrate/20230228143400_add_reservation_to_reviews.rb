class AddReservationToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :reservation, index: true
  end
end
