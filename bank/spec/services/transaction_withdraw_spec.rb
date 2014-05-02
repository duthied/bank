require "spec_helper"

describe TransactionWithdraw do
  
  before(:all) do
    @user = FactoryGirl.create(:user)
    @account = FactoryGirl.create(:account)
  end

  describe 'sufficient balance' do 
    before(:all) do 
      @withdraw_amount = 10
      @starting_balance = 100

      @account.balance = @starting_balance
      @account.save!
      
      @trans_response = TransactionWithdraw.call(@account, @withdraw_amount)
    end

    it "returns success of true" do
      expect(@trans_response.success?).to eq(true)
    end

    it "returns balance correctly" do
      expect(@trans_response.balance).to eq(@starting_balance - @withdraw_amount)
    end

    it "returns no error" do
      expect(@trans_response.error).to eq(nil)
    end

  end

  describe 'insufficient balance' do 
    before(:all) do 
      @withdraw_amount = 100
      @starting_balance = 10

      @account.balance = @starting_balance
      @account.save!
      
      @trans_response = TransactionWithdraw.call(@account, @withdraw_amount)
    end

    it "returns success of false" do
      expect(@trans_response.success?).to eq(false)
    end

    it "returns balance correctly" do
      expect(@trans_response.balance).to eq(@starting_balance)
    end

    it "returns no error" do
      expect(@trans_response.error).to_not eq(nil)
    end

  end

end
