require 'spec_helper'

describe AccountController do

  let(:user) { FactoryGirl.create(:user) }
  let(:account) { FactoryGirl.create(:account, user: user, balance: 100) }

  describe "POST 'withdraw'" do
    pending "need to figure out how to correctly do this"
    # it "returns success" do
    #   expect(:post => "/api/account/#{account.id}/withdraw", :amount => 10).to be_success
    # end
  end

  describe "GET 'balance'" do
    pending "need to figure out how to correctly do this"
    # it "returns http success" do
    #   get "/api/account/#{account.id}/balance"
    #   expect(response).to be_success
    # end
  end

end
