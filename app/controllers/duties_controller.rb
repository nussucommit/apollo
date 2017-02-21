class DutiesController < ApplicationController
  def index
    date = params[:date]
    starting_date = date - (date.cwdays - 1)
    # @duties = Array.new(7)
    # starting_date.upto(starting_date + 7) do |day|
    #  @duties.push(day)
    # end
    @duties = Array.new(starting_date..(starting_date + 7))
    @time_ranges = Time_range.all
    @places = Place.all
  end

  def process_grab
    @user = User.find(user_params)
    @duty = Duty.find(duty_params)

    # user_id of the selected duty_id should and must be null
    redirect_to action: 'index' if @duty.update(@user)
  end

  def process_drop
    @user = User.find(user_params)
    @duty = Duty.find(duty_params)

    redirect_to action: 'index' if @duty.update(:user_id, nil)
  end

  def edit
    @user_id = User.find(user_params)
    @duty_id = Duty.find(duty_params)
  end

  def update
    @user_id = User.find(user_params)
    @duty_id = Duty.find(duty_params)

    redirect_to action: 'index' if @duty.update(@user)
  end

  def set_default
    @user = User.find(user_params)
    @timeslot = Timeslot.find(timeslot_params)

    redirect_to action: 'index' if @timeslot.update(@user)
  end
  
  private
  def user_params
    params.require(:users).permit(:user_id)
  end

  def duty_params
    params.require(:duties).permit(:duty_id)
  end

  def timeslot_params
    params.require(:timeslots).permit(:timeslot_id)
  end
  end

end
