class UsersController < ApplicationController
  def index
  end
  def new
  end
  def edit
  end
  def update
  end
  def create 
  end 
  def show
  end
  def destroy
  end

  private 
  
  def user_params
    params.require(:user).permit(:user_name, :password, :email)
  end
end
