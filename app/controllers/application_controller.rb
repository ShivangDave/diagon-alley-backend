class ApplicationController < ActionController::API

  def current_user
    token = request.headers['Auth-Token']
    payload = decode(token)
    if payload
      @user = Api::V1::User.find_by(id: payload[0]["data"]["user_id"])
    else
      false
    end
  end

  def authorized
    !!current_user
  end

  def decode(token)
    begin
      decoded_token = JWT.decode token, ENV['JWT_TOKEN_KEY'], true, { algorithm: 'HS256' }
    rescue JWT::ExpiredSignature
      unauthorized({ "error": "Session expired.. Try Login.." })
    rescue JWT::DecodeError
      unauthorized({ "error": "Please login.." })
    end
  end

  # Handles Token Validation
  def unauthorized(msg)
    render :json => msg, :status => :unauthorized
    nil
  end

end
