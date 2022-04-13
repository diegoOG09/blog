Rails.application.routes.draw do
  
  root to: "posts#index"
  resources :posts, :tags
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/articles/article/:article_id', to: "articles#article", as: "article"
end
