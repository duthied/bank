Bank::Application.routes.draw do

  # root to: 'admin/dashboard#index'
  root to: 'account#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users,
             path_names:
             {
               sign_in: 'login',
               sign_out: 'logout'
             },
             controllers:
             {
               registrations: 'registrations'
             }

  get '/accounts',
      to: 'account#index',
      as: 'account_index_web'

  get '/accounts/:id',
      to: 'account#show',
      as: 'account_show_web'

  post '/accounts/:id/withdraw',
       to: 'account#withdraw',
       as: 'account_withdraw_web'

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
