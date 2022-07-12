class Api::V2::MotorcyclesController < ApplicationController
  before_action :authorized, only: %i[index show]
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
    render json: @motorcycle
  end

  # CREATE MOTORCYCLE
  def create
    @motorcycle = Motorcycle.create(motorcycle_params.merge(user: @user))
    if @motorcycle.save
      render json: { motorcycle: @motorcycle, message: 'Motorcycle created successfully!' }, status: :created
    else
      render json: { error: @motorcycle.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # UPDATE MOTORCYCLE
  def update
    if @motorcycle.update(motorcycle_params)
      render json: { motorcycle: @motorcycle, message: 'Motorcycle updated successfully' }, status: :ok
    else
      render json: { error: @motorcycle.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_motorcycle
    @motorcycle = @user.motorcycles.find(params[:id])
  end

  def motorcycle_params
    params.permit(:model, :title, :description, :price, :duration, :discount, :image)
  end
end
