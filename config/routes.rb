Rails.application.routes.draw do
  get 'comments/index'

  get 'comments/new'

  devise_for :users
  #my root page
  root 'welcome#index'

  #route to welcome index
  get 'welcome/index'

  #routes to posts
  resources :posts, only:[:index,:show]
  #admin routes
  namespace :admin do
    resources :posts
    resources :projects
  end
  #routes to projects
  resources :projects 
  #routes to contacts
  resources :contacts, only:[:new,:create]
end
