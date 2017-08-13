Rails.application.routes.draw do
  #my root page
  root 'welcome#index'

  resources :posts
end
