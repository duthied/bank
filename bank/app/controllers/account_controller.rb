# Account Controller
class AccountController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :auth_user_from_headers

  def withdraw
    account = find_account(@user, params[:id])
    amount = params[:amount].to_f

    @response = TransactionWithdraw.call(account, amount)
  end

  def balance
    @account = find_account(@user, params[:id])
  end

  def show
    @account = find_account(@user, params[:id])
  end

  def index
    @accounts = find_accounts(@user)
  end

  private

  def not_found
    render status: 404, text: 'Not Found'
  end

  def find_account(user, id)
    user.accounts.find_by_id(id) || not_found
  end

  def find_accounts(user)
    user.accounts || not_found
  end

  def auth_user_from_headers
    @user = User
      .find_by_card_number_and_pin(
        request.headers['X-Card-Number'],
        request.headers['X-Pin']
      )

    render status: 403, text: 'Forbidden' unless @user
  end

end
