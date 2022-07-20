class Api::V1::UsersController < ApplicationController
  before_action :authorized, only: %i[show auto_login]
  # USER
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    @motorcycle = Motorcycle.where({ id: @user[:id] })
    @reservation = Reservation.where({ user_id: @user[:id] })
    user = { user: @user, motorcycle_created: @motorcycle.length, reservation_created: @reservation.length }
    render json: user
  end

  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: }
    else
      render json: { error: 'Invalid username or password' }
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(email: params[:email])

    if @user
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: }
    else
      create
    end
  end

  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:photo, :username, :email)
  end
end
