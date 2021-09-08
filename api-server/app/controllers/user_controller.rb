require 'rest-client'

class UserController < ApplicationController
  def_param_group :required_info do
    param :email, String, :desc => "user email", :required => true
    param :password, String, :required => true
  end

  api!
  param_group :required_info
  param :nickname, String, :required => true
  error 404, "Not Found User"
  def join

    join_request_dto = {
      :email => params[:email],
      :nickname => params[:nickname],
      :password => params[:password]
    }

    UserService.join(join_request_dto)

    render :json => {}
  end

  api!
  param_group :required_info
  returns :code => 200 do
    property :token, String, :desc => "Access Token"
  end
  def login

    login_request_dto = {
      :email => params[:email],
      :password => params[:password]
    }

    render :json => {:token => UserService.login(login_request_dto)}
  end

  api!
  param :code, String, :desc => 'github auth code'
  returns :code => 200 do
    property :token, String, :desc => "Access Token"
  end
  def git_login

    code = params[:code]

    profile = GitOauth.git_login(code)

    render :json => {:profile => profile}
  end

end
