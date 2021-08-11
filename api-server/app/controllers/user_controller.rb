class UserController < ApplicationController

  def join

    login_request_dto = {
      :eamil => params[:eamil],
      :nickname => params[:nickname],
      :password => params[:password]
    }

    User.join(login_request_dto[:email], login_request_dto[:nickname], login_request_dto[:password])

    render :json => {}
  end

end
