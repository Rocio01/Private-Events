class UsersController < ApplicationController
    def index 
        @users = User.all
    end

    def new 
        @user = User.new
    end


    def create 

        user = User.new
        user.user_name = (params[:user][:user_name])
        if user.save
          redirect_to"/users"
        else
          flash[:errors] = user.errors.full_messages
          redirect_to "/users/new" 
        end
      

    end

    def show
        @user = User.find(params[:id])
    end

  

    private
    def user_params
        params.require(:user).permit(:user_name)
    end
end
