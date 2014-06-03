# /app/models/user.rb
class User < ActiveRecord::Base

  include Rails.application.routes.url_helpers

  devise :database_authenticatable,
         :rememberable,
         :trackable,
         :validatable,
         authentication_keys: [:card_number, :pin]

  has_many :accounts, dependent: :destroy
  has_many :transaction_logs, dependent: :destroy

  # attr_accessible :card_number, :pin

  validates_uniqueness_of :card_number
  validates_length_of :card_number, is: 9, allow_blank: false
  validates_length_of :pin, is: 4, allow_blank: false

  def links
    links = []
    links << RelLink.new('self', user_show_url)
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

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
