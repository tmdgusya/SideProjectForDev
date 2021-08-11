require 'bcrypt'
require 'code_error'

class User < ApplicationRecord
  include BCrypt

  module Role
    GUEST = 'GUEST'
    USER = 'USER'
    ADMIN = 'ADMIN'
  end

  class << self

    def join(email, nickname, password)

      is_email_duplicate?(email)

      User.create(:email => email, :password => password, :nickname => nickname, :role => Role::USER, :is_delete => false)
    end

    def is_email_duplicate?(email)
      email = User.find_by_email(email)

      if email.present?
        CodeError.raise(400, "동일 이메일이 중복됩니다.")
      end

      true
    end

    private def password_hashing(password)
      Password.create(password)
    end

  end

end
