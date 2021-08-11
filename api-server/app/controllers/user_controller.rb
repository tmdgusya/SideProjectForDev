class UserController < ApplicationController

  def join

    join_request_dto = {
      :eamil => params[:eamil],
      :nickname => params[:nickname],
      :password => params[:password]
    }

    User.join(join_request_dto[:email], join_request_dto[:nickname], join_request_dto[:password])

    render :json => {}
  end

  def login

    login_request_dto = {
      :email => params[:email],
      :password => params[:password]
    }

    User.login(login_request_dto[:email], login_request_dto[:password])

    render :json => {}
  end

end
