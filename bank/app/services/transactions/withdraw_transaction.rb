# /app/services/transactions/withdraw_transaction.rb
class WithdrawTransaction

  def self.call(account, amount)

    # get balance
    current_balance = account.balance

    # enough balance for withdraw amount?
    if current_balance >= amount
      new_balance = current_balance - amount
      # if so, update balance
      # => log transaction
      # => Transactions::Log(user, account, before_balance, after_balance)

    else
      # raise ExceptionType, "Error Message"
    end

  end

end
