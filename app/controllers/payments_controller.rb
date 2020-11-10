class PaymentsController < ApplicationController
    def index
      redirect_to root_url if current_user.nil?
      redirect_to houses_path if current_user.house.nil?
      @payments = current_user.house.payments.order('id desc')
      @question = Question.new
      end
  
    def create
        @payment = Payment.new(payment_params)
        @payment.user_id = current_user.id
        @payment.house_id = current_user.house.id
        @payment.save
      
      @roommates = current_user.house.users.where.not(id:current_user.id)
      
      amount = payment_params[:amount].to_f / (@roommates.size+1)
      
      # add @roommates.size * amount to self
      current_user.update_attribute(:balance, current_user.balance + @roommates.size * amount)
      
      # subtract this payment to all other roomates balance
      @roommates.each do |roommate|
        roommate.update_attribute(:balance, roommate.balance - amount)
      end
      
        redirect_to payments_path
    end
  
    def new
        redirect_to root_url if current_user.nil?
        redirect_to houses_path if current_user.house.nil?
        @payment = Payment.new
    end
  
    def edit
    end
    
    def destroy
        @payment = Payment.find(params[:id])
      total_amount = @payment.amount
        @payment.destroy
      
      @roommates = current_user.house.users.where.not(id:current_user.id)
      amount = total_amount / (@roommates.size+1)
      
      # add back this payment to all other roomates balance
      if @payment.question
        @payment.question.destroy
      else 
        current_user.update_attribute(:balance, current_user.balance - @roommates.size * amount)
        @roommates.each do |roommate|
          roommate.update_attribute(:balance, roommate.balance + amount)
        end    
      end
      
      redirect_to payments_path
      end
    
  private
    def payment_params
      params.require(:payment).permit(:id, :description, :amount)
    end  
end