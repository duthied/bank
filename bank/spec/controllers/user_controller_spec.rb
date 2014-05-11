require 'spec_helper'

describe UserController, :type => :controller do

  let(:user) { FactoryGirl.build(:user) }
  let(:account) { FactoryGirl.build(:account, user: user, balance: 10) }
  
  context 'incorrect authentication' do
  	
  	it 'should return 403' do
  		get :show
	  	expect(response.response_code).to eq(403)
  	end
  	
  end

  context 'correct authentication' do
  	pending "can't get auth_user_from_headers to stub correctly"
  	# before(:each) do
  	# 	controller.class.stub(:auth_user_from_headers).and_return(user)
	  # 	get :show
	  # end

  	# it 'should return success' do
  	# 	expect(response.response_code).to eq(200)
  	# end

	  it 'should return json'
	  it 'should return user object'

  end


end
