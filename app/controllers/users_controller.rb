class UsersController < ApplicationController
	def new
	  @user = User.new
	end
  
	def create
	  @user = User.new(user_params)
	  @user.balance = 0
	  @user.save
	  redirect_to @user
	end
  
	def show
	  @user = User.find(params[:id])
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
  
  private
	def user_params
	  params.require(:user).permit(:name, :password, :email)
	end
  end