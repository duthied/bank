object @user
attributes :card_number, :pin, :links

child :accounts do
  attributes :id, :title, :balance, :links
end
