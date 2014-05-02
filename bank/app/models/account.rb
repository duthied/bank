# /app/models/account.rb
class Account < ActiveRecord::Base

  belongs_to :user
  delegate  :card_number,
            :pin,
            to: :user, prefix: true, allow_nil: true
            
  validates_length_of :title, in: 8..16, :allow_blank => false
  validates :user, presence: true

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
