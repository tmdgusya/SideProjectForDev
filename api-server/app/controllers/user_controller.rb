require 'rest-client'

class UserController < ApplicationController

  def join

    join_request_dto = {
      :eamil => params[:eamil],
      :nickname => params[:nickname],
      :password => params[:password]
    }

    UserService.join(join_request_dto)

    render :json => {}
  end

  def login

    login_request_dto = {
      :email => params[:email],
      :password => params[:password]
    }

    render :json => {:token => UserService.login(login_request_dto)}
  end

  def git_login

    code = params[:code]

    profile = GitOauth.git_login(code)

    render :json => {:profile => profile}
  end

end
