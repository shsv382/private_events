Rails.application.routes.draw do
  
	root to: "users#index"
	resources :users
	get 'signup' => "users#new"

	resources :sessions, only: [:new, :create, :destroy]
	get 'signin' => "sessions#new"
	get 'sessions' => "sessions#new"
	get 'signout' => "sessions#destroy"

end
