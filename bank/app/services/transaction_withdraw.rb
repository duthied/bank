# /app/services/transaction_withdraw.rb
class TransactionWithdraw

  def self.call(account, amount)
    current_balance = account.balance

    if current_balance >= amount
      new_balance = current_balance - amount
      # if so, update balance
      account.balance = new_balance
      account.save!
      TransactionResponse.new(true, new_balance)
    else
      TransactionResponse.new(false, current_balance, "Insufficient balance for this request.  Available balance: #{current_balance}")
    end

  end

end
