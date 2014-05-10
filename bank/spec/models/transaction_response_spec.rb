# /spec/models/transaction_response_spec.rb
require 'spec_helper'

describe TransactionResponse do

  let(:trans_response) { TransactionResponse.new(true, 10) }
  subject { trans_response}

  it { should respond_to(:error) }
  it { should respond_to(:success?) }
  it { should respond_to(:balance) }

  it 'should report the balance correctly' do
    expect(subject.balance).to eq(10)
  end

  context 'failed response' do
    @error_msg = 'error message'
    subject { TransactionResponse.new(false, 0, @error_msg) }

    it 'should have a success of false' do
      expect(subject.success?).to eq(false)
    end

    it 'error message should match what was passed in at creation' do
      expect(subject.error).to eq(@error_msg)
    end

  end

  context 'success response' do
    subject { TransactionResponse.new(true, 0) }
    
    it 'should have a success of true' do
      expect(subject.success?).to eq(true)
    end

    it 'should not have an error' do
      expect(subject.error).to eq(nil)
    end

  end

end
