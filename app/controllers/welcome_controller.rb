class WelcomeController < ApplicationController

  # GET /welcome
  def index
    unless logged_in?
  		redirect_to '/login'
  	end
  end

end
