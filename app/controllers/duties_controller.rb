class DutiesController < ApplicationController
  def index; end

  def process_grab
    @user = User.find(params[:user_id])
    @duty = Duty.find(params[:duty_id])

    # user_id of duty should and must be nil
    if @duty.user.nil? && @duty.update(user: @user)
      flash[:notice] = 'Successfully grabbed duty!'
    else
      flash[:alert] = 'Failed to grab duty!'
    end
    redirect_to :index
  end

  def process_drop
    @duty = Duty.find(params[:duty_id])

    if @duty.update(user: nil)
      flash[:notice] = 'Successfully dropped duty!'
    else
      flash[:alert] = 'Failed to drop duty!'
    end
    redirect_to :index
  end

  def edit # mass edit
    @duties = Duty.all
  end

  def update
    @duties = params[:duties]
    @duties.each do |duty_id, user_id|
      Duty.find(duty_id).update(user_id: user_id)
    end
  end
end
