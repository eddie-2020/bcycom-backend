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
end
