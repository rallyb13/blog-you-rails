Rails.application.routes.draw do
  root :to => 'home#index'

  get '/log-in' => 'sessions#new'
  post '/log-in' => 'sessions#create'
  get '/log-out' => 'sessions#destroy', as: :log_out

  resources :users, :only => [:new, :create, :show]

  resources :posts do
    resources :comments, :except => [ :index, :show ]
  end

  resources :messages, :only => [:new, :create]
end
