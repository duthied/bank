class UserController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  # before_filter :auth_user_from_headers

  def show
    @user = auth_user_from_headers(request.headers['X-Card-Number'], request.headers['X-Pin'])
    if @user.nil?
        render :status => 403, :text => 'Forbidden'
      end
  end

  private 

    def auth_user_from_headers(card_number, pin)
      User.find_by_card_number_and_pin(card_number, pin)
    end

end
