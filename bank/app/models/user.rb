class User < ActiveRecord::Base

  validates_uniqueness_of :card_number
  validates_length_of :card_number, :is => 9, :allow_blank => false
  validates_length_of :pin, :is => 4, :allow_blank => false

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
