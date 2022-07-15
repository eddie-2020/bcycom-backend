class Api::V1::ReservationsController < ApplicationController
  before_action :authorized, only: %i[create update destroy]

  def index
    @reservation = Reservation.all
    if @reservation
      render json: @reservation
    else
      render json: { error: 'No reservation yet!' }, status: :not_found
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    user = User.find(@reservation[:user_id])
    motorcycle = Motorcycle.find(@reservation[:motorcycle_id])
    reserve = { reservation: @reservation, motorcycle:, created_by: user }
    render json: reserve
  end

  def create
    reserve = params.require(:reservation)
      .permit(:phone, :motorcycle_id)
      .merge(user: @user)
    @reservation = Reservation.create(reserve)
    if @reservation.save
      render json: { reservation: @reservation, message: 'Reservation created successfully!' }, status: :created
    else
      render json: { error: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update; end

  def destroy; end

  private

  def reservation_params
    params.require(:reservation).permit(:phone, :motorcycle_id)
  end
end
