Rails.application.routes.draw do
  resources :users
  resources :posts do
    resources :rating
  end
  match 'post_hash' => 'posts#hash', via: :get
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
