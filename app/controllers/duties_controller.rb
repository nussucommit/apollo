class DutiesController < ApplicationController
  def index
    date = params[:date]
    starting_date = date - (date.cwdays-1)
    @duties = Array.new(7) { |e| e = starting_date.next_day}
    @time_ranges = Time_range.all
    @places = Place.all
  end

  def process_grab  
    @user_id = User.find(user_id_params)
    @duty_id = Duty.find(dutyid_params)

    #user_id of duty_id should and must be null
    if @duty_id.update(@user_id)
      redirect_to :action => 'index'
    end
  end

  def process_drop
    @user_id = User.find(user_id_params)
    @duty_id = Duty.find(dutyid_params)

    if @duty_id.update(:user_id, nil)
      redirect_to :action => 'index'
    end
  end

  def user_id_params
    params.require(:users).permit(:user_id)
  end

  def duty_id_params
    params.require(:duties).permit(:duty_id)
  end

  def edit; end

  def update; end

  def setdefault; end
end
