class DutiesController < ApplicationController
  def index
  end

  def process_grab
    @user = User.find(params[:user_id])
    @duty = Duty.find(params[:duty_id])

    # user_id of duty_id should and must be null
    redirect_to action: 'index' if @duty.update(@user_id)
  end

  def process_drop
    @user = User.find(params[:user_id])
    @duty = Duty.find(params[:duty_id])

    redirect_to action: 'index' if @duty.update(:user_id, nil)
  end

  def edit
    render 'admin_edit'
  end

  def update
    render 'admin_update'
  end

  def admin_edit # mass edit
    @user = User.find(params[:user_id])
    @duties = Duty.find(params[:duty_ids])
  end

  def admin_update
    @user = User.find(params[:user_id])
    @duties = Duty.find(params[:duty_ids])
    @duties.each do |duty|
      process_grab(duty.params[:user_id], params[:duty_id])
      unless duty.update(duty_params)
        flash[:notice] = 'Error!'
        render 'admin_edit'
      end
    end
    flash[:notice] = 'Successfully update the duty status!'
    redirect_to root_path
  end



  private

  def user_id_params
    params.require(:users).permit(:user_id)
  end

  def duty_params
    params.require(:duties).permit(:duty_id)
  end

  def timeslot_params
    params.require(:timeslots).permit(:timeslot_id)
  end
end
