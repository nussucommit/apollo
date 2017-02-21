class DutiesController < ApplicationController
  def index
    date = params[:date]
    starting_date = date - (date.cwdays - 1)
    @duties = Array.new(7)
    starting_date.upto(starting_date + 7) do |day|
      @duties.push(day)
    end
    @time_ranges = Time_range.all
    @places = Place.all
  end

  def process_grab
    @user_id = User.find(user_id_params)
    @duty_id = Duty.find(duty_id_params)

    # user_id of duty_id should and must be null
    redirect_to action: 'index' if @duty_id.update(@user_id)
  end

  def process_drop
    @user_id = User.find(user_id_params)
    @duty_id = Duty.find(duty_id_params)

    redirect_to action: 'index' if @duty_id.update(:user_id, nil)
  end

  def edit
    @user_id = User.find(user_id_params)
    @duty_id = Duty.find(duty_id_params)
  end

  def update
    @user_id = User.find(user_id_params)
    @duty_id = Duty.find(duty_id_params)

    redirect_to action: 'index' if @duty_id.update(@user_id)
  end

  def setdefault
    @user_id = User.find(user_id_params)
    @timeslot_id = Timeslot.find(timeslot_id_params)

    redirect_to action: 'index' if @timeslot_id.update(@user_id)
  end

  def user_id_params
    params.require(:users).permit(:user_id)
  end

  def duty_id_params
    params.require(:duties).permit(:duty_id)
  end

  def timeslot_id_params
    params.require(:timeslots).permit(:timeslot_id)
  end
end
