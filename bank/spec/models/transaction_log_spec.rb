# /spec/models/transaction_log_spec.rb
require 'spec_helper'

describe TransactionLog do

  it { should respond_to(:before_balance) }
  it { should respond_to(:after_balance) }
  it { should belong_to(:user) }
  it { should belong_to(:account) }
  
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
