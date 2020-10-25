Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 	devise_for :users,
  controllers: { registrations: 'registrations' }

 	root 'pages#home'
 	resources :users, only: %i(show)

 	resources :posts, only: %i(new create index) do
    resources :audios, only: %i(create)
  end
end
