class Api::V1::ReservationsController < ApplicationController
  before_action :authorized, only: %i[index create destroy]
end
