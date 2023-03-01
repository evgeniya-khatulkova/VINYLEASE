class ReservationsController < ApplicationController
  before_action :set_reservation, only: :show
  before_action :set_record, only: %i[new create]

  def index
    @reservations = Reservation.all
  end

  def show
    @reviews = @reservation.reviews
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.record = @record

    @reservation.user = current_user
    if @reservation.save
      redirect_to records_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_record
    @record = Record.find(params[:record_id])
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:record_id, :start_date, :end_date)
  end
end
