class AnnouncementsController < ApplicationController
  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(announcement_params)
    flash.now[:notice] = 'Announcement created!' if @announcement.save

    render :new
  end

  def index
    @announcements = Announcement.all
  end
  
  private

  def announcement_params
    params.require(:announcement).permit(:title, :contents, :date)
  end
end
