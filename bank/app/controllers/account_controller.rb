class AccountController < ApplicationController
  skip_before_filter  :verify_authenticity_token
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
    # logger.debug("in show => params id:#{params[:id]}, user:#{@user.id}")
    @account = find_account(@user, params[:id])
    # logger.debug("account:#{@account.title}")
  end

  def index
    @accounts = find_accounts(@user)
  end

  private

    def not_found
      render :status => 404, :text => 'Not Found'
    end

    def find_account(user, id)
      # logger.debug("in find_account => params user:#{user.id}, id:#{id}")
      user.accounts.find_by_id(id) || not_found
    end

    def find_accounts(user)
      user.accounts || not_found
    end

    def auth_user_from_headers
      @user = User.find_by_card_number_and_pin(request.headers['X-Card-Number'], request.headers['X-Pin'])
      if @user.nil?
        render :status => 403, :text => 'Forbidden'
      end
    end

end
