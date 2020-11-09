class UsersController < ApplicationController
	def new
		@user = User.new
	end
  
	def create
		@user = User.new(user_params)
		@user.balance = 0
		if @user.save
			flash[:success] = "Welcome to the Sample App!"
			redirect_to @user
		else
			flash[:danger] = "Sth Goes Wrong!"
			render 'new'
		end
	end
  
	def show
		unless current_user
			return redirect_to '/login'
		end
		@user = User.find(params[:id])
		if current_user.house != @user.house
			return redirect_to root_url
		end
		if current_user.house
			@roommates = current_user.house.users
			@messages_from = Message.where(from_id:current_user.id).where(to_id:@user.id)
			@messages_to = Message.where(to_id:current_user.id).where(from_id:@user.id)
			@messages = (@messages_from.or(@messages_to)).order('id desc')
		end
	end
  
	# Returns true if the given token matches the digest.
	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end
  
	# Forgets a user.
	def forget
		update_attribute(:remember_digest, nil)
	end

	def edit
		@user = User.find(params[:id])
	end
	
	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:success] = "Profile updated"
			redirect_to @user
		else
			render 'edit'
		end
	end
	
private 
	def user_params
		params.require(:user).permit(:name, :password, :email)
	end
end