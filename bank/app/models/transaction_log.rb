# /app/models/transaction_log.rb
class TransactionLog < ActiveRecord::Base

  validates :user, presence: true
  validates :account, presence: true
  validates :before_balance, presence: true
  validates :after_balance, presence: true

  belongs_to :user
  delegate  :card_number,
            :pin,
            to: :user, prefix: true, allow_nil: true

  belongs_to :account
  delegate  :balance,
            :title,
            to: :account, prefix: true, allow_nil: true

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
