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
    redirect_to duties_path
  end

  def process_drop
    @duty = Duty.find(params[:duty_id])

    @duty.update(user: nil)
    redirect_to duties_path, notice: 'Successfully dropped duty!'
  end

  def mass_edit # mass edit
    @timeslots = Timeslot.all.order(:start_time)
    @places = Place.all
    week_offset = params[:week_offset] || 0
    day_offset = (Time.zone.now.wday - 1) % 7
    start_date = Time.zone.now - day_offset.days + week_offset.weeks
    @duties = Duty.where("date >= #{start_date} && " \
                         "date < #{start_date + 7.days}")
  end

  def mass_update
    @duties = Duty.find(params[:duty_ids])
    @user = User.find(params[:user_id])
    @duties.each do |duty|
      duty.update(user: @user)
    end
    redirect_to mass_edit_duties_path, notice: 'Successfully updated duties!'
  end
end
