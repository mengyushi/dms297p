class RepaysController < ApplicationController
  
    def index
      redirect_to root_url if current_user.nil?
      redirect_to houses_path if current_user.house.nil?
      
      @to_me = current_user.house.repays.where(to_id:current_user.id)
      @from_me = current_user.repays
      
      p @from_me
      # @waiting_for_confirm
      # @waiting_to_confirm
      # @all_repays
      
    end
    
    def new
      
      redirect_to root_url if current_user.nil?
      redirect_to houses_path if current_user.house.nil?
      
      @repay = Repay.new
      @roommates = current_user.house.users.where.not(id:current_user.id)
    end
    
    def create
      
      @repay = Repay.new(repay_params)
      @repay.to_id = current_user.house.users.find_by(name:repay_params[:to_id]).id
      @repay.house = current_user.house
      @repay.user = current_user
      @repay.confirmed = false
      
      @repay.save
      
      return redirect_to repays_path
    end
    
    def update
      @repay = Repay.find(params[:id])
      @repay.confirmed = true
      @repay.user.update_attribute(:balance, @repay.user.balance + @repay.amount)
      to_user = User.find(@repay.to_id)
      to_user.update_attribute(:balance, to_user.balance - @repay.amount)
      @repay.save
      return redirect_to repays_path
    end
    
    private
      def repay_params
        params.require(:repay).permit(:id, :to_id, :amount)
      end   
end