# /app/services/transaction_audit.rb
class TransactionAudit

  def self.call(user, account, before_balance, after_balance)
    TransactionLog.create! do |tc|
      tc.user_id = user.id
      tc.account_id = account.id
      tc.before_balance = before_balance
      tc.after_balance = after_balance
    end
  end

end
