Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #users
  get '/users/new', to: "users#new", as: "new_user" #form to create a user
  post '/users', to: "users#create" #actually create users
  get '/users/:id', to: "users#show", as: "user" #individual page/profile
  get '/users/:id/edit', to: "users#edit", as: "edit_user" #editing individual profile
  patch '/users/:id', to: "users#update" #actually updates info
  delete '/users/:id', to: "users#destroy" #deletes user account

  #meetings
  get '/meetings', to: "meetings#index", as: "meetings" #all the meetings
  get '/meetings/new', to: "meetings#new", as: "new_meeting" #create meeting
  post '/meetings', to: "meetings#create"

  #categories
  get '/categories', to: "categories#index", as: "categories" #all the categories

end
