# /app/models/account.rb
class Account < ActiveRecord::Base

  include Rails.application.routes.url_helpers

  belongs_to :user
  delegate  :card_number,
            :pin,
            to: :user, prefix: true, allow_nil: true
            
  has_many :transaction_logs, dependent: :destroy

  validates_length_of :title, in: 6..16, :allow_blank => false
  validates :user, presence: true

  after_save :create_audit_record
  after_initialize :set_starting_balance

  def links
    links = Array.new
    links << RelLink.new("self", account_show_path(self.id))
  end

  private

    def create_audit_record
      if self.balance_changed?
        # when account is created, balance can be nil
        before_balance = self.balance_change[0] || 0
        after_balance = self.balance_change[1]
        TransactionAudit.call(self.user, self, before_balance, after_balance)
      end
    end

    def set_starting_balance
      if new_record?
        self.balance ||= 0
      end
    end

end

# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  balance    :decimal(, )
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#
