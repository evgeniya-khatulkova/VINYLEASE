class ReviewsController < ApplicationController
  before_action :set_reservation, only: %i[new create]
  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(review_params)
    @review.reservation = @reservation
    @review.save
    redirect_to review_path(@reservation)
  end

  def new
    @reservation = Reservation.find(params[:reservation_id])
    @review = Review.new
  end

  def index
    @reviews = Review.all
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reservation_path(@reservation)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_reservation
    @reservation = Reservation.find(params[:reservation_id])
  end
end
