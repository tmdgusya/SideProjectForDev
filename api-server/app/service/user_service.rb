class UserService

  class << self

    def join(join_request_dto)
      User.join(join_request_dto[:email], join_request_dto[:nickname], join_request_dto[:password])
    end

    def login(login_request_dto)

      user = User.login(login_request_dto[:email], login_request_dto[:password])

      token_box = encode_token({:id => user.id, :role => user.role})

      user.auth_token = token_box[:refresh_token]
      user.save

      return token_box[:access_token]
    end

  end

end
