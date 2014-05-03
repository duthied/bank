Bank::Application.routes.draw do

  root to: 'admin/dashboard#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  post '/api/account/:id/withdraw', to: 'account#withdraw', as: 'account_withdraw'
  get '/api/account/:id/balance', to: 'account#balance', as: 'account_balance'

end
