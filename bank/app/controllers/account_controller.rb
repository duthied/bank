class AccountController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def withdraw
    account = Account.find(params[:id])
    amount = params[:amount].to_f

    @response = TransactionWithdraw.call(account, amount)

    logger.debug("response:#{@response.success?}")
  end

  def balance

  end

end
