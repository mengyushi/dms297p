class WelcomeController < ApplicationController

  # GET /welcome
  def index
  	unless logged_in?
        redirect_to '/login'
    else
        if !current_user.house_id.nil?
            @house = House.find(current_user.house_id)
        else
            @house = nil
        end
    end
  end

end
