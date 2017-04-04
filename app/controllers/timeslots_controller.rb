class TimeslotsController < ApplicationController

  def mass_set_default_select
    @user = User.find(params[:user_id])
    @timeslot = Timeslot.find(params[:timeslot_id])
    @duties = Duty.find(params[:duty_ids])
  end

  def mass_set_default_process
    @user = User.find(params[:user_id])
    @timeslot = Timeslot.find(params[:timeslot_id])
    @duties = Duty.find(params[:duty_ids])
    @duties.each do |duty|
      @duty.@timeslot.update(default_user: @user)
    end
  end
end
