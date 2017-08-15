Rails.application.routes.draw do
  devise_for :users
  #my root page
  root 'welcome#index'

  #route to welcome index
  get 'welcome/index'

  #routes to posts
  resources :posts
  #routes to projects
  resources :projects 
  #routes to contacts
  resources :contacts, only:[:new,:create]
end
