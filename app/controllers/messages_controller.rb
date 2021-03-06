class MessagesController < ApplicationController
	def new
		redirect_to root_url if current_user.nil?
 		redirect_to houses_path if current_user.house.nil?
		@message = Message.new
		@roommates = current_user.house.users.where.not(id:current_user.id)
	end

	def create
		@message = Message.new(message_params)
	  	@message.open = true
	  	@message.from_id = current_user.id
	  	@message.to_id = current_user.house.users.find_by(name:message_params[:to_id]).id
	  	@message.save
	  	redirect_to messages_path
	end

	def index
		@recieved = Message.where(to_id:current_user.id)
		@send = Message.where(from_id:current_user.id)
		@recent_messages = Message.where(from_id:current_user.id).or(Message.where(to_id:current_user.id)).order('id desc').limit(20)
		@roommates = current_user.house.users
		@message = Message.new
	end

	def destroy
	  	@message = Message.find(params[:id])
	  	@message.destroy
	  
	  	return redirect_to messages_path
	end

private
	def message_params
    	params.require(:message).permit(:to_id, :content)
  	end
end