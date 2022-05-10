Rails.application.routes.draw do
  get 'rating/new'
  get 'rating/create'
  get 'post/new'
  get 'post/create'
  get 'post/show'
  get 'user/new'
  get 'user/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
