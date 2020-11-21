class SchedulesController < ApplicationController
	def new
		redirect_to root_url if current_user.nil?
 		redirect_to houses_path if current_user.house.nil?
		@schedule = Schedule.new
	end

	def create
		@schedule = Schedule.new(schedule_params)
	  	@schedule.save
	  	redirect_to schedules_path
	end

	def index
		@schedule = Schedule.new
	end

	def destroy
	end

private
	def schedule_params
    	params.require(:schedule).permit(:title, :description, :place)
  	end
end
