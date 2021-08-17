class ApplicationController < ActionController::Base

  before_action :decoded_token
  protect_from_forgery with: :null_session

  def initialize
    @secret_key = "Jrl9qW7dQlTjKMKbFIWmCtWRNuAMtpfr"
    @current_user = nil
  end

  ### payload {key: value, key2: value, ...}
  def encode_token(data)
    expired_access_token_payload = {data: data, exp: 1.day.to_i}
    expired_refresh_token_payload = {data: data, exp: 2.week.to_i}
    return {
      :access_token => JWT.encode(expired_access_token_payload, @secret_key, 'HS256'),
      :refresh_token => JWT.encode(expired_refresh_token_payload, @secret_key, 'HS256')
    }
  end

  def decoded_token
    token = request.headers["x-jwt"]

    if token.present?
      begin
      decoded_token = valid_token(token)
      user_id = decoded_token[0]['id']
      @current_user = User.find_by_id(user_id)
      #TODO @current_user 의 token 도 decoded 한다.
      valid_token(@current_user.auth_token)
      rescue JWT::ExpiredSignature
        raise CodeError(500, "토큰이 만료되었습니다. 다시 응답을 보내주세요")
      end
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
