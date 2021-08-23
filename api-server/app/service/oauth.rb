module Oauth

  def self.login(code)
    raise CodeError(500, "Plz Impl This Func")
  end

  def self.parse_access_token(response)
    raise CodeError(500, "Plz Impl This Func")
  end

  def self.parse_refresh_token(response)
    raise CodeError(500, "Plz Impl This Func")
  end

end