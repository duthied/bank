class AccountController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  before_filter :card_auth_check

  def withdraw
    account = find_account(params[:id])
    amount = params[:amount].to_f
    
    @response = TransactionWithdraw.call(account, amount)
  end

  def balance
    @account = find_account(params[:id])
  end

  private

    def find_account(id)
      Account.find(id)
    end

    def card_auth_check
      if User.find_by_card_number_and_pin(request.headers['X-Card-Number'], request.headers['X-Pin']).nil?
        render :status => 403, :text => 'Forbidden'
      end
    end

end
