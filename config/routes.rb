Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #users  
  get "/users", to: "users#login", as: "login"
  get '/users/new', to: "users#new", as: "new_user" #form to create a user
  post '/users', to: "users#create" #actually create users
  get '/users/:id', to: "users#show", as: "user" #individual page/profile
  post "/send_form_here", to: "users#handle_login"
  get '/users/:id/edit', to: "users#edit", as: "edit_user" #editing individual profile
  patch '/users/:id', to: "users#update" #actually updates info
  delete '/users/:id', to: "users#destroy" #deletes user account
  delete 'logout', to: "users#logout", as: "logout"

  #meetings
  get '/meetings', to: "meetings#index", as: "meetings" #all the meetings
  get '/meetings/new', to: "meetings#new", as: "new_meeting" #choose category to create meeting
  get '/meetings/new/form', to: "meetings#meeting_form", as: "meeting_form" #form to create meeting
  post '/meetings', to: "meetings#create" #creates meeting
  # post '/meetings', to: "meetings#create" #actually creates the meeting
  #post '/meetings/:id/form', to: "meetings#meeting_form", as: "meeting_form"
  get '/meetings/:id', to: "meetings#show", as: "meeting" #specific meeting info

  #categories
  get '/categories', to: "categories#index", as: "categories" #all the categories; our welcome page
  get '/categories/:id', to: "categories#show", as: "category" 

  #subcategories
  get '/subcategories', to: "subcategories#index", as: "subcategories" #all the subcategories

end
