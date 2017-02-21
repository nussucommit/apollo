class DutiesController < ApplicationController
  def index
    @start_time = TimeRange.order(:start_time).first &&
                  TimeRange.order(:start_time).first.start_time
    @end_time = TimeRange.order(:end_time).last &&
                TimeRange.order(:end_time).last.end_time
    @announcements = Announcement.all
  end
end
