# /spec/models/account_spec.rb
require 'spec_helper'

describe Account do

  it { should respond_to(:title) }
  it { should validate_presence_of(:user) }
  
  it { should ensure_length_of(:title).is_at_least(6).is_at_most(16) }
  it { should belong_to(:user) }
  it { should have_many(:transaction_logs) }
  
  let(:user) { FactoryGirl.create(:user) }
  let(:account) { FactoryGirl.create(:account, user: user, balance: 0) }
  
  describe 'should log balance change' do 
    before do 
      @audit_log_count_before = account.transaction_logs.count
      @withdraw_amount = 10
      @starting_balance = 100

      account.balance = @starting_balance
      account.save!
    end

    it "audit logs increase" do
      expect(account.transaction_logs.count).to eq(@audit_log_count_before + 1)
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
