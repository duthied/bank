# /spec/models/account_spec.rb
require 'spec_helper'

describe Account do

  it { should respond_to(:title) }
  it { should ensure_length_of(:title).is_at_least(8).is_at_most(16) }
  it { should belong_to(:user) }

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
