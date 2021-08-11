require 'bcrypt'
require 'code_error'

class User < ApplicationRecord

  module Role
    GUEST = 'GUEST'
    USER = 'USER'
    ADMIN = 'ADMIN'
  end

  class << self

    def join(email, nickname, password)

      is_email_duplicate?(email)

      User.create(:email => email, :password => password_hashing(password), :nickname => nickname, :role => Role::USER, :is_delete => false)
    end

    def login(email, password)

      user = User.find_by_email(email)

      if user.nil?
        CodeError.raise(400, '해당 이메일은 존재하지 않습니다.')
      end

      unless user.is_same_password?(password)
        CodeError.raise(400, '비밀번호를 잘못 입력하셨습니다.')
      end

    end

    def is_email_duplicate?(email)
      email = User.find_by_email(email)

      if email.present?
        CodeError.raise(400, "동일 이메일이 중복됩니다.")
      end

      true
    end

    def password_hashing(password)
      BCrypt::Password.create(password, :cost => 6)
    end

  end

  def is_same_password?(password)
    BCrypt::Password.new(self.password) == password
  end

end
