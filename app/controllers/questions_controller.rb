class QuestionsController < ApplicationController
  
    def index
      @questions = current_user.house.questions
    end
    
    def create
      
      p question_params
      
      @question = Question.new(question_params)
      @question.house_id = current_user.house.id
      @question.save
      @payment = Payment.find(question_params[:payment_id])
      
      @payment.update_attribute(:question_id, @question.id)
      
      @roommates = current_user.house.users.where.not(id:current_user.id)
      payer = User.find(@payment.user_id)
      amount = @payment.amount / (@roommates.size+1)
      # substract this payment to payer's balance
      payer.update_attribute(:balance, payer.balance - amount)
      # add back this payment to all other roomates balance
      @roommates.each do |roommate|
        roommate.update_attribute(:balance, roommate.balance + amount) unless roommate == payer
      end
      # add back this payment to self
      current_user.update_attribute(:balance, current_user.balance + amount)
  
      redirect_to questions_path
    end
    
    def destroy
      @question = Question.find(params[:id])
      @payment = Payment.find(@question.payment_id)
      
      @payment.update_attribute(:question_id, nil)
      
      @roommates = current_user.house.users.where.not(id:current_user.id)
      
      payer = User.find(@payment.user_id)
      amount = @payment.amount / (@roommates.size+1)
      
      # add this payment to payer's balance
      payer.update_attribute(:balance, payer.balance + amount)
      # substract this payment to all other roomates balance
      @roommates.each do |roommate|
        roommate.update_attribute(:balance, roommate.balance - amount) unless roommate == payer
      end
      # substract this payment to self
      current_user.update_attribute(:balance, current_user.balance - amount)
      
      @question.destroy
  
        redirect_to questions_path  
    end
    
    private
      def question_params
        params.require(:question).permit(:id, :payment_id, :user_id)
      end  
      
end