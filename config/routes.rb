Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/search', to: 'searches#index'
  post '/search', to: 'searches#search'
  get '/search/:id', to: 'searches#index'
  get '/concertinfo/:id', to: 'searches#show'
  get '/redirect', to: 'users#redirect', as: 'redirect'
  get '/callback', to: 'users#callback', as: 'callback'
  post '/events/:calendar_id', to: 'users#new_event', as: 'new_event', calendar_id: /[^\/]+/
  get '/calendars', to: 'users#calendars', as: 'calendars'
  get '/events/:calendar_id', to: 'users#events', as: 'events', calendar_id: /[^\/]+/

	resources :users
	resources :concerts

	post '/concerts', to: 'concerts#update'


	root to: 'home#index'
  post '/users', to: 'concerts#update'


	post '/login', to: 'sessions#create'
	  
	post '/logout', to: 'sessions#destroy'

	get '/login', to: 'home#login'

end