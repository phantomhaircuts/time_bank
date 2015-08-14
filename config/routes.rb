Rails.application.routes.draw do
  root 'profiles#welcome'
  get '/services', to: 'services#index'

  resources :transactions, only: [:create]

  resources :profiles do
    resources :services
  end

  # small tip, but it improves readability to align things like this to columns,
  # like so:
  get  '/sign_in',  to: 'users#sign_in'
  post '/sign_in',  to: 'users#sign_in!'
  get  '/sign_up',  to: 'users#sign_up'
  post '/sign_up',  to: 'users#sign_up!'
  get  '/sign_out', to: 'users#sign_out'

  get "/welcome" => 'profiles#welcome'
end
