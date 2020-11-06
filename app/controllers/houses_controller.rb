class HousesController < ApplicationController
    def index
      unless logged_in?
          redirect_to '/login'
        end
    end
  
    def login_house
        @house = House.new
        case 
          when House.where(name: params[:name]).where(code: params[:code]).size == 1
              then
                house = House.find_by(name: params[:name])
                current_user.update_columns(house_id:house.id)
                redirect_to '/'
          else
          end
    end
  
    def new
        @house = House.new
    end
  
    def create
        @house = House.new(house_params)
        @house.save
        redirect_to @house
    end
  
    def show
        @house = House.find(params[:id])
    end
  
    def edit
      @house = House.find(params[:id])
    end
  
    def update
      @house = House.find(params[:id])
      if @house.update_attributes(house_params)
        flash[:success] = "Profile updated"
        redirect_to @house
      else
        render 'edit'
      end
    end
  
  private
    def house_params
      params.require(:house).permit(:name, :code ,:currency, :rent, :balance)
    end
  
  end