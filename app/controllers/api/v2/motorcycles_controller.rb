class Api::V2::MotorcyclesController < ApplicationController
  before_action :authorized, only: %i[index show]

  # MOTOCYCLES
  def index
    @motorcycles = Motorcycle.all
    if @motorcycles
      render json: @motorcycles
    else
      render json: { error: 'No motorcycles yet!' }, status: :not_found
    end
  end
end
