class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:notice] = 'User created!'
    end

    render :new
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :name,
                                 :password_confirmation, :matric_number,
                                 :phone_number, :cell, :position)
  end
end
