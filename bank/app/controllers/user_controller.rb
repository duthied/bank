# User Controller
class UserController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def show
    @user = auth_user_from_headers(
      request.headers['X-Card-Number'],
      request.headers['X-Pin']
      )
    render status: 403, text: 'Forbidden' unless @user
  end

  private

  def auth_user_from_headers(card_number, pin)
    User.find_by_card_number_and_pin(card_number, pin)
  end

end
