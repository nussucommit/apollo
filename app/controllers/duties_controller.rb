class DutiesController < ApplicationController
  def index
    @start_time = TimeRange.order(:start).first.start
    @end_time = TimeRange.order(:end).last.end
  end
end
