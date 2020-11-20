class DicesController < ApplicationController
	def new
		redirect_to root_url if current_user.nil?
 		redirect_to houses_path if current_user.house.nil?
		@dice = Dice.new
    end

	def create
        @dice = Dice.new(dice_params)
        @dice.result = rand(6) + 1
        @dice.user = current_user
        @dice.house = current_user.house
	  	@dice.save
	  	redirect_to dices_path
    end
    
	def index
        @dice = Dice.new
        @recent_rolls = Dice.where(house:current_user.house).order('id desc').limit(10)
    end
    
    private
	def dice_params
    	params.require(:dice).permit(:to_id)
  	end
end
