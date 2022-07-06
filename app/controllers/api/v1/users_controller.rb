class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update delete]

  def index
    @users = User.all
    render json: @users if @users
  end

  def show
    render json: @user if @user
  end

  def create
    @user = User.create(user_params)

    if @user.save
      render json: { success: true, message: 'User loged in successfully.' }, status: :created
    else
      render json: { success: false, message: @user.error.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: { success: true, message: 'User updated successfully', user: @user }
    else
      render json: { success: false, message: @user.error.full_messages }, status: :bad_request
    end
  end

  def destroy
    if @user.destroy
      render json: { success: true, messsage: 'User deleted successfully' }, status: :ok
    else
      render json: { success: false, message: @user.errors.full_messages }, status: :bad_request
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
