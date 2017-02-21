Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
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
      @user_id = User.find(params[:user_id])
      @duty_id = Duty.find(params[:duty_id])

      # user_id of duty_id should and must be null
      redirect_to action: 'index' if @duty_id.update(@user_id)
    end

    def process_drop
      @user_id = User.find(params[:user_id])
      @duty_id = Duty.find(params[:duty_id])

      redirect_to action: 'index' if @duty_id.update(:user_id, nil)
    end

    def edit
      @user_id = User.find(params[:user_id])
      @duty_id = Duty.find(params[:duty_id])
    end

    def update
      @user_id = User.find(params[:user_id])
      @duty_id = Duty.find(params[:duty_id])

      redirect_to action: 'index' if @duty_id.update(@user_id)
    end

    def set_default
      @user_id = User.find(params[:user_id])
      @timeslot_id = Timeslot.find(params[:timeslot_id])

      redirect_to action: 'index' if @timeslot_id.update(@user_id)
    end
  end
end
