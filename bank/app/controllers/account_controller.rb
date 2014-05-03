class AccountController < ApplicationController
  skip_before_filter  :verify_authenticity_token

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

end
