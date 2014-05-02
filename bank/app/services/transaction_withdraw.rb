# /app/services/transaction_withdraw.rb
class TransactionWithdraw

  def self.call(account, amount)

    # get balance
    current_balance = account.balance

    # enough balance for withdraw amount?
    if current_balance >= amount
      new_balance = current_balance - amount
      # if so, update balance
      account.balance = new_balance
      account.save!
      # => log transaction
      # => Transactions::Log(user, account, before_balance, after_balance)
      TransactionResponse.new(true, new_balance)
    else
      TransactionResponse.new(false, current_balance, "Insufficient balance for that withdrawl.  Available balance: #{current_balance}")
    end

  end

end
