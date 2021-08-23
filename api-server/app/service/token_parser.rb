class TokenParser

  class << self

    def valid_token(token)
      begin
        decoded_token = JWT.decode token,  @secret_key, true, { algorithm: 'HS256'}
        return decoded_token
      rescue JWT::DecodeError
        Rails.logger.warn "Error decoding the JWT : " + e.to_s
      end
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

  end

end