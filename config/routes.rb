Rails.application.routes.draw do
  
	resources :events, only: [:index, :new, :create, :show]
	root to: "events#index"
	resources :users
	get 'signup' => "users#new"

	resources :sessions, only: [:new, :create, :destroy]
	get 'signin' => "sessions#new"
	get 'sessions' => "sessions#new"
	get 'signout' => "sessions#destroy"

end
