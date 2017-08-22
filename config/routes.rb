Rails.application.routes.draw do
  devise_for :users
  #my root page
  root 'welcome#index'

  #route to welcome index
  get 'welcome/index'

  #routes to posts
  resources :posts, only:[:index,:show] do
    resources :comments
  end

  resources :comments do
    resources :comments
  end
  #admin routes
  namespace :admin do
    resources :posts
    resources :projects
  end
  #routes to projects
  resources :projects 
  #routes to contacts
  resources :contacts, only:[:new,:create]
  resources :referals
end
