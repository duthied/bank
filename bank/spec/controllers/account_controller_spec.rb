require 'spec_helper'

describe AccountController do

  describe "GET 'withdraw'" do
    it "returns http success" do
      get 'withdraw'
      expect(response).to be_success
    end
  end

  describe "GET 'balance'" do
    it "returns http success" do
      get 'balance'
      expect(response).to be_success
    end
  end

end
