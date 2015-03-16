Rails.application.routes.draw do
	root to: "static_pages#index", via: :get

	resources :sessions, only: [:new, :create]
	get "login" => "sessions#new", as: :login
	post "logout" => "sessions#destroy", as: :logout

	resources :users

	namespace :dashboard do
		root to: "dashboard#index"

		resources :collections
		resources :cards
	end
end
