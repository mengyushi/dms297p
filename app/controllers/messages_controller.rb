class MessagesController < ApplicationController
	def new
	  @message = Message.new
	end

	def create
	  @message = Message.new(message_params)
	  @message.open = true
	  @message.from = current_user.id
	  @message.save
	  redirect_to @message
	end

	def show
	  @message = Message.find(params[:id])
	end
	
	def index
  	  @recieved = Message.where(to:current_user.id)
  	  @send = Message.where(from:current_user.id)
  	end

	def destroy
	  @message = Message.find(params[:id])
	  @message.destroy

	  redirect_to messages_path
	end

private
  def message_params
	params.require(:message).permit(:to, :content)
  end
end
