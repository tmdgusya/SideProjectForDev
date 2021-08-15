class ApplicationController < ActionController::Base

  before_action :decoded_token
  protect_from_forgery with: :null_session

  def initialize
    @secret_key = "Jrl9qW7dQlTjKMKbFIWmCtWRNuAMtpfr"
    @current_user = nil
  end

  ### payload {key: value, key2: value, ...}
  def encode_token(payload)
    JWT.encode payload, @secret_key, 'HS256'
  end

  def decoded_token
    token = request.headers["x-jwt"]

    if token.present?
      decoded_token = valid_token(token)
      user_id = decoded_token[0]['id']
      @current_user = User.find_by_id(user_id)
    end

  end

  def valid_token(token)

    unless token
      return nil
    end

    begin
      decoded_token = JWT.decode token,  @secret_key, true, { algorithm: 'HS256'}
      return decoded_token
    rescue JWT::DecodeError
      Rails.logger.warn "Error decoding the JWT : " + e.to_s
    end
  end

end
