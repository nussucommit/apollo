class UsersController < ApplicationController
  def edit
  end
  def update
  end
  def show
  end
  def destroy
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    flash.now[:notice] = 'User created!' if @user.save

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
