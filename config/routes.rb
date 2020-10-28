Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 	devise_for :users,
  controllers: { registrations: 'registrations' }

 	root 'posts#index'

 	get '/users/:id', to: 'users#show', as: 'user'
 	
 	resources :users do
 		member do
    		put :avater_update
  		end
 	end

	resources :posts, only: %i(index new create show destroy) do
    resources :audios, only: %i(create)
		resources :likes, only: %i(create destroy)
		resources :comments, only: %i(create destroy)
  	end
end
