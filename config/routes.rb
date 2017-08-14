Rails.application.routes.draw do
  #my root page
  root 'welcome#index'

  #route to welcome index
  get 'welcome/index'

  #routes to posts
  resources :posts
  #routes to projects
  resources :projects 
end
