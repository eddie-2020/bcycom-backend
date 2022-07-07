class Api::V1::UsersController < ApplicationController
  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      # token = encode_token({user_id: @user.id})
      render json: { user: @user }
    else
      render json: { error: 'Invalid username or password' }
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(username: params[:username])

    if @user&.authenticate(params[:password])
      # token = encode_token({user_id: @user.id})
      render json: { user: @user }
    else
      render json: { error: 'Invalid username or password' }
    end
  end

  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
