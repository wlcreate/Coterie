class WelcomeController < ApplicationController
    
    skip_before_action :authorized_to_see_page

end
