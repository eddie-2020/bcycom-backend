class Api::V1::MotorcyclesController < ApplicationController
  before_action :authorized, only: %i[create update destroy]
  before_action :set_motorcycle, only: %i[update]

  # MOTORCYCLES
  def index
    @motorcycles = Motorcycle.all
    if @motorcycles
      render json: @motorcycles
    else
      render json: { error: 'No motorcycles yet!' }, status: :not_found
    end
  end

  # MOTORCYCLE
  def show
    @motorcycle = Motorcycle.find(params[:id])
    user = User.find(@motorcycle[:user_id])
    reservation = Reservation.where({ id: @motorcycle[:id] })
    puts reservation
    cycle = { motrcycle: @motorcycle, created_by: user, reservations: reservation.length }
    render json: cycle
  end

  # CREATE MOTORCYCLE
  def create
    cycle = params.require(:motorcycle)
      .permit(:cylinder, :description, :model, :acceleration, :title, :price, :duration, :discount, images: [])
      .merge(user: @user)
    @motorcycle = Motorcycle.create(cycle)
    if @motorcycle.save
      render json: { motorcycle: @motorcycle, message: 'Motorcycle created successfully!' }, status: :created
    else
      render json: { error: @motorcycle.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # UPDATE MOTORCYCLE
  def update
    @motorcycle = Motorcycle.find(params[:id])
    if @motorcycle[:user_id] == @user[:id]
      update_cycle = params.require(:motorcycle)
        .permit(:cylinder, :description, :model, :acceleration, :title, :price, :duration, :discount, images: [])
        .merge(user: @user)
      if @motorcycle.update(update_cycle)
        render json: { motorcycle: @motorcycle, message: 'Motorcycle updated successfully!' }
      else
        render json: { errors: @motorcycle.errors.full_messages, message: 'Motorcycle not updated!' }
      end
    else
      render json: { message: 'Only the owner is permitted to update this motorcycle!' }
    end
  end

  # DELETE MOTORCYCLE
  def destroy
    @motorcycle = Motorcycle.find(params[:id])
    if @motorcycle[:user_id] == @user[:id]
      if @motorcycle.destroy
        render json: { motorcycles: @motorcycles, message: 'Motorcycle deleted successfully!' }, status: :ok
      else
        render json: { errors: @motorcycle.errors.full_messages,
                       message: 'Motorcycle not deleted!' },
               status: :unauthorized_user
      end
    else
      render json: { message: 'Only the owner is permitted to delete this motorcycle!' }
    end
  end

  private

  def set_motorcycle
    @motorcycle = Motorcycle.find(params[:id])
  end
end
