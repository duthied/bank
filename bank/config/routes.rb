Bank::Application.routes.draw do

  # root to: 'admin/dashboard#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'login#index'

  get '/accounts',
      to: 'account#index',
      as: 'account_index'

  get '/accounts/:id',
      to: 'account#show',
      as: 'account_show'

  post '/accounts/:id/withdraw',
       to: 'account#withdraw',
       as: 'account_withdraw'

  # API routes
  get '/api/accounts',
      to: 'account#index',
      as: 'accounts_index',
      defaults: { format: 'json' }

  get '/api/accounts/:id',
      to: 'account#show',
      as: 'account_show',
      defaults: { format: 'json' }

  post '/api/accounts/:id/withdraw',
       to: 'account#withdraw',
       as: 'account_withdraw',
       defaults: { format: 'json' }

  get '/api/accounts/:id/balance',
      to: 'account#balance',
      as: 'account_balance',
      defaults: { format: 'json' }

  get '/api/user',
      to: 'user#show',
      as: 'user_show',
      defaults: { format: 'json' }

end
