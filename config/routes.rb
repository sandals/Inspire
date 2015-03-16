Rails.application.routes.draw do
	root to: "static_pages#index", via: :get

	resources :sessions, only: [:new, :create]
	get "login" => "sessions#new", as: :login
	post "logout" => "sessions#destroy", as: :logout

	get "dashboard" => "dashboard#index", as: :dashboard

	resources :users

	resources :cards
end
