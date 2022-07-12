class Api::V2::MotorcyclesController < ApplicationController
  before_action :authorized, only: %i[index show]

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
end
