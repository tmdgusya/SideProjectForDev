require 'rest-client'
require 'json'

class GitOauth
  include Oauth

  module KEY
    CLIENT_ID = '7f8c268c407297518728'
    SECRET_KEY = '8060b43522131eac6ab51c5d5bdf627c9b20a268'
  end

  module URL
    CALLBACK_URL = 'http://localhost:3000/git-oauth'
    GET_PROFILE_URL = 'https://github.com/login/oauth/access_token'
    GET_PROFILE = 'https://api.github.com/user'
  end


  class << self
    public def git_login(code)
      url = "#{URL::GET_PROFILE_URL}?client_id=#{KEY::CLIENT_ID}&client_secret=#{KEY::SECRET_KEY}&code=#{code}"
      response = RestClient.post(url, nil, nil )
      Rails.logger.info "Response? #{response}"
      token = get_access_token(response)
      profile = JSON.parse(RestClient.get(URL::GET_PROFILE, {:Authorization => "token #{token}"}))
      Rails.logger.info "Response? #{profile}"
      User.join(profile['email'],  profile['login'], 'random')

      user = User.find_by_email(profile['email'])
      return TokenParser.encode_token({:id => user.id, :role => user.role})[:access_token]
    end

    def get_access_token(response)
      access_token, token_type = response.split("&")
      token_key, token_value = access_token.split("=")
      return token_value
    end
  end

end