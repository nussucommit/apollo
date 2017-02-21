class TimeslotsController < ApplicationController
  def set_default
    @user = User.find(params[:user_id])
    @timeslot = Timeslot.find(params[:timeslot_id])

    redirect_to action: 'index' if @timeslot.update(@user_id)
  end

  def mass_set_default
    @duties = Duty.find(params[:duty_ids])
    @duties.each do |duty|
      set_default(duty, duty.params[:user_id], params[:timeslot_id])
    end
  end
end
