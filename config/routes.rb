Rails.application.routes.draw do
  #get 'user/index'
  get 'user/show'
  #get 'event/index'
  #get 'event/show'
  #get 'static_pages/index'
  get 'static_pages/secret'
root 'events#index'


  devise_for :users
  get 'events/index'
  #get 'events/new'	
  #get 'events/create'
  resources :events
  #resources :user

  devise_scope :user do
  	get '/users/sign_out'=> 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
