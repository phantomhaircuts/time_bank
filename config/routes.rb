Rails.application.routes.draw do
  root 'services#index'
  get '/services', to: 'services#index'

  resources :transactions, only: [:create]

  resources :profiles do
    resources :services
  end

  get '/sign_in', to: 'users#sign_in'
  post '/sign_in', to: 'users#sign_in!'
  get '/sign_up', to: 'users#sign_up'
  post '/sign_up', to: 'users#sign_up!'
  get '/sign_out', to: 'users#sign_out'

end
