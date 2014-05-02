# /app/models/transaction_log.rb
class TransactionLog < ActiveRecord::Base
end

# == Schema Information
#
# Table name: transaction_logs
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  account_id     :integer
#  before_balance :decimal(, )
#  after_balance  :decimal(, )
#  created_at     :datetime
#  updated_at     :datetime
#
