class Api::V1::ReservationsController < ApplicationController
  before_action :authorized, only: %i[index create destroy]

  def index
    @user_reservations = Reservation.where(user_id: params[:user_id])
    render json: { user_reservations: @user_reservations }
  end

  def show
    @reservation = Reservation.find(params[:id])
    render json: { reservation: @reservation }
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = params[:user_id]
    if @reservation.save
      render json: { reservation: @reservation, message: 'Reservation created successfully!' }, status: :created, location: @reservation
    else
      render json: { errors: @reservation.errors.full_messages, message: 'Reservation not created!' }, status: :unprocessable_entity
    end
  end
  
  private

  def reservation_params
    params.require(:reservation).permit(:reservation_time, :motorcycle_id)
  end
end
