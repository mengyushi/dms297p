class SchedulesController < ApplicationController
	def new
		redirect_to root_url if current_user.nil?
 		redirect_to houses_path if current_user.house.nil?
		@schedule = Schedule.new
	end

	def create
        @schedule = Schedule.new(schedule_params)
        @schedule.user = current_user
        @schedule.house = current_user.house
	  	@schedule.save
	  	redirect_to schedules_path
	end

	def index
        @schedule = Schedule.new
        @interval = Interval.new
        @schedules = Schedule.where(house_id:current_user.house_id)
    end
    
	def show
		unless current_user
			return redirect_to '/login'
		end
		redirect_to root_url and return unless current_user
	  
		@schedule = Schedule.find(params[:id])
		@interval = Interval.new
        @roommates = current_user.house.users
        
    end
    
    def destroy
	end

private
	def schedule_params
    	params.require(:schedule).permit(:title, :description, :place)
  	end
end
