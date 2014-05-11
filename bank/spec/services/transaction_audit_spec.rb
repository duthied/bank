require "spec_helper"

describe TransactionAudit do
  
  let(:user) { FactoryGirl.create(:user) }
  let(:account) { FactoryGirl.create(:account) }

  context 'should create a transaction log when account balance changes' do

    let(:transaction_log) { TransactionAudit.call(user, account, 10, 20) }
    subject { transaction_log }

    it 'should create a transaction log with correct user' do
      expect(transaction_log.user_id).to eq(user.id)
    end

    it 'should create a transaction log with correct account' do
      expect(transaction_log.account_id).to eq(account.id)
    end

    it 'should create a transaction log with correct before balance' do
      expect(transaction_log.before_balance).to eq(10)
    end

    it 'should create a transaction log with correct after balance' do
      expect(transaction_log.after_balance).to eq(20)
    end

  end

end
