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
    puts
    @reservation = Reservation.find(params[:id])
    user = User.find(@reservation[:user_id])
    motorcycle = Motorcycle.find(@reservation[:motorcycle_id])
    reserve = { reservation: @reservation, motorcycle:, created_by: user }
    render json: reserve
  end
  def getReservation
    puts reservation_params
    @reservation= Reservation.where(reservation_params)
    if @reservation
      render json: @reservation
    else
      render json: { error: 'No reservation yet!' }, status: :not_found
    end
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

  def update
    update_reservation = @user.motorcycle.find_by(id: params[:id])
    if update_reservation
      @reservation = Reservation.find(params[:id])
      update_reservation = params.require(:reservation)
        .permit(:phone, :user_id, :motorcycle_id)
        .merge(user: @user)
      if @reservation.update(update_reservation)
        render json: { reservation: @reservation, message: 'Reservation updated successfully!' }
      else
        render json: { errors: @reservation.errors.full_messages, message: 'Reservation not updated!' }
      end
    else
      render json: { message: 'Only the owner of this reservation is permitted to update it!' }
    end
  end

  def destroy
    delete_reservation = @user.motorcycle.find_by(id: params[:id])
    if delete_reservation
      @reservation = Reservation.find(params[:id])
      if @reservation.destroy
        render json: { reservation: @reservation, message: 'Reservation deleted successfully!' }, status: :ok
      else
        render json: { errors: @reservation.errors.full_messages,
                       message: 'Reservation not deleted!' },
               status: :unauthorized_user
      end
    else
      render json: { message: 'Only the owner is permitted to delete this reservation!' }
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:phone,:motorcycle_id)
  end
end
