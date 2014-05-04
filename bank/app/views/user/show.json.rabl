object @user
attributes :card_number, :pin, :links

child :accounts do
  attributes :title, :balance, :links
end
