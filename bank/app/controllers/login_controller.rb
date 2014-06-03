# /atm/app/controllers/login_controller.rb
class LoginController < ApplicationController

  def index
  end

  def authenticate
    # make an api call via api_request service to authenticate the credentials
    response = AuthAPIRequest.call(params[:card_number], params[:pin])
    if response.success?
      set_credentials(response.data['card_number'], response.data['pin'])

      flash[:notice] = 'Login Successful'
      redirect_to account_index_path
    else
      # bad auth
      flash[:error] = response.error
      redirect_to root_path
    end
  end

end
