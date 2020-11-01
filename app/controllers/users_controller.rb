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
end

private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end