class IntervalsController < ApplicationController
	def new
		redirect_to root_url if current_user.nil?
 		redirect_to houses_path if current_user.house.nil?
		@interval = Interval.new
	end

	def create
		@interval = Interval.new(interval_params)
		@interval.user = current_user
		@interval.house = current_user.house
	  	@interval.save
	  	redirect_to schedules_path
	end

	def index
		@interval = Interval.new
		@all_intervals = Interval.where(schedule__id:@schedule.id)
	end

	def show
		@interval = Interval.new
	end

	def destroy
	end

private
	def interval_params
    	params.require(:interval).permit(:start, :end, :schedule_id)
  	end
end
