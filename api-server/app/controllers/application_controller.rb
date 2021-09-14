class ApplicationController < ActionController::Base

  before_action :decoded_token
  around_action
  protect_from_forgery with: :null_session

  def initialize
    @secret_key = "Jrl9qW7dQlTjKMKbFIWmCtWRNuAMtpfr"
    @current_user = nil
  end

  ### payload {key: value, key2: value, ...}
  def encode_token(data)
    TokenParser.encode_token(data)
  end

  def decoded_token
    token = request.headers["x-jwt"]

    if token.present?
      begin
      d_token = TokenParser.valid_token(token)
      user_id = d_token[0]["data"]["id"]
      @current_user = User.find_by_id(user_id)
      #TODO @current_user 의 token 도 decoded 한다.
      TokenParser.valid_token(@current_user.auth_token)
      rescue JWT::ExpiredSignature
        raise CodeError(500, "토큰이 만료되었습니다. 다시 응답을 보내주세요")
      end
    end

  end

  def is_error?

  end

end
