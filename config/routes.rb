Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #homepage
  root "welcome#home" 
  get "welcome/home", to: "welcome#home", as: "home"

  #users  
  get "/login", to: "users#login", as: "login"
  get '/signup', to: "users#new", as: "signup" #form to create a user
  post '/users', to: "users#create" #actually create users
  get '/users/:id', to: "users#show", as: "user" #individual page/profile
  post "/send_form_here", to: "users#handle_login", as: "handle_login"
  get '/users/:id/edit', to: "users#edit", as: "edit_user" #editing individual profile
  patch '/users/:id', to: "users#update" #actually edits/updates info
  delete '/users/:id', to: "users#destroy" #deletes user account
  delete 'logout', to: "users#logout", as: "logout"
  get '/user/:id/profile', to: "users#profile", as: "profile"
  
  get '/users/:user_id/meetings', to: "meetings#index", as: "user_meetings" #all of a user's meetings (host & attendee)
  get '/users/:user_id/meetings/:id/edit', to: "meetings#edit", as: "edit_meeting" #form for host to update title, desc, time
  patch '/users/:user_id/meetings/:id', to: "meetings#update", as: "user_meeting" #actually updates the meeting info
  delete 'users/:user_id/meetings/:id', to: "meetings#destroy" #deletes the meeting

  get '/users/:user_id/registrations/:id/edit', to: "registrations#edit", as: "edit_registration" #form for attendee to change if they are attending; will display all meeting/registration info
  delete 'users/:user_id/registrations/:id', to: "registrations#destroy" #deletes/cancels attendee registration

  #meetings
  get '/meetings/new', to: "meetings#new", as: "new_meeting" #choose category to create meeting
  get '/meetings/new/form', to: "meetings#meeting_form", as: "meeting_form" #form to create meeting
  post '/meetings', to: "meetings#create" #actually creates meeting
  get '/meetings/:id', to: "meetings#show", as: "meeting" #specific meeting info

  #categories
  get '/categories', to: "categories#index", as: "categories" #all the categories; our welcome page
  get '/categories/:id', to: "categories#show", as: "category" #shows the categories and related subcategories

  #subcategories
  get '/subcategories', to: "subcategories#index", as: "subcategories" #all the subcategories
  get '/subcategories/:id', to: "subcategories#show", as: "subcategory" #specific subcategory and shows all meetings

  #registrations
  get '/registrations/new', to: "registrations#new", as: "new_registration" #create registration form
  post '/registrations', to: "registrations#create" #create the registration

end
