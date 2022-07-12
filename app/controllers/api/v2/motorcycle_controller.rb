class Api::V2::MotorcycleController < ApplicationController
    before_action :authorized, only: %i[index show]
end
