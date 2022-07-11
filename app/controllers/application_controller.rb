class ApplicationController < ActionController::API
  before_action :authorized

  def encode_token(payload)
    JWT.encode(payload, 'yourSecret')
  end

  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['token']
  end

  def decoded_token
    return unless auth_header

    token = auth_header
    # header: { 'Authorization': 'Bearer <token>' }
    begin
      JWT.decode(token, 'yourSecret', true, algorithm: 'HS256')
    rescue JWT::DecodeError
      nil
    end
  end

  def logged_in_user
    return unless decoded_token

    user_id = decoded_token[0]['user_id']
    @user = User.find_by(id: user_id)

  end

  def logged_in?
    !!logged_in_user
  end

  def authorized
    render json: { message: 'Please try to log in before accesing resources' }, status: :unauthorized unless logged_in?
  end
end
