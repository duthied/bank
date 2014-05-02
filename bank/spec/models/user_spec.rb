# /spec/models/user_spec.rb
require 'spec_helper'

describe User do

  it { should respond_to(:card_number) }
  it { should ensure_length_of(:card_number).is_equal_to(9) }
  it { should validate_uniqueness_of(:card_number) }

  it { should respond_to(:pin) }
  it { should ensure_length_of(:pin).is_equal_to(4) }

end

# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  card_number :string(255)
#  pin         :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#
