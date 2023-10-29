Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :top
  get "/top/top_logout_path"
  get '/top_logout_path', to: 'top#top_logout_path', as: 'top_logout_path'
  #get '/likes', to: 'likes#create' 
  post 'top/new',to:'top#new'
  post '/top/cID',to:'top#cID'
  get '/cID', to: 'top#cID'
  
  post '/likes', to: 'likes#create'
 # get '/like/:id', to: 'likes#destroy', as: 'like'
  get '/likes', to: 'likes#destroy', as: 'like'
  
   post 'top/login', to: 'top#login'
   get '/login', to: 'top#login', as: 'flogin'
  
  get 'top/main',to: 'top#main'
  root 'top#main'

  # Defines the root path route ("/")
  # root "articles#index"
end
