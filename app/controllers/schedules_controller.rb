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
		
		p "====== HERE ======"

		@all_intervals = Interval.where(schedule_id:@schedule.id)
		p @all_intervals
		dictionary = {}
		@roommates.each do |curr|
			dictionary[curr.id] = []
		end

		@all_intervals.each do |int|
			dictionary[int.user.id].append([int.start, int.end])
		end

		@roommates.each do |curr|
			dictionary[curr.id] = dictionary[curr.id].sort
		end

		if @roommates.length == 1
			@common = dictionary[current_user.id]
		else
			common = dictionary[@roommates[0].id]
			(1..@roommates.length - 1).to_a.each do |i|
				p "ROOMMATE: "
				p @roommates[i].id
				new_common = []
				curr = dictionary[@roommates[i].id]
				# find common time interval between curr and common
				p1 = 0
				p2 = 0
				while p1 < common.length and p2 < curr.length
					if common[p1][0] > curr[p2][1]
						p2 = p2 + 1
					elsif common[p1][1] < curr[p2][0]
						p1 = p1 + 1
					else
						t1 = [common[p1][0], curr[p2][0]].max
						t2 = [common[p1][1], curr[p2][1]].min
						# p "********"
						# p common[p1]
						# p curr[p2]

						# p "t1: "
						# p t1
						# p "t2: "
						# p t2
						
						if t1 != t2
							new_common.append([t1, t2])
						end
						p1 = p1 + 1
						p2 = p2 + 1
					end
				end
				common = new_common
			end
			@common = common
		end

		

		p dictionary
		p "COMMON:"
		p @common


		p "====== END ======"
    end
    
    def destroy
	end

private
	def schedule_params
    	params.require(:schedule).permit(:title, :description, :place)
  	end
end
