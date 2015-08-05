Rails.application.routes.draw do
  root 'profiles#index'
  get '/services', to: 'services#index'
  resources :profiles do
  resources :services
  end
end
