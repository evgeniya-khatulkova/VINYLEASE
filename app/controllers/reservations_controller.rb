class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show destroy]
  before_action :set_record, only: %i[new create]

  def index
    @reservations = Reservation.all

    if params[:status].present?
      if params[:status] == "accepted"
        Reservation.find(params[:reservation_id]).update(status: "accepted")
      else
        Reservation.find(params[:reservation_id]).update(status: "declined")
      end
    end
  end

  def show
    @reviews = @reservation.reviews
  end

  def new
    @reservation = Reservation.new
  end

  def destroy
    @reservation.destroy
    redirect_to reservations_path 
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.record = @record
    @reservation.user = current_user
    if @reservation.save
      redirect_to reservations_path
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
