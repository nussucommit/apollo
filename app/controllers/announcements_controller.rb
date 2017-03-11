class AnnouncementsController < ApplicationController
  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(announcement_params)
    if @announcement.save
      redirect_to announcements_path
      flash[:notice] = 'Announcement created!'
    else
      redirect_to announcements_new_path
    end
  end

  def index
    @announcements = Announcement.order(created_at: :desc)
  end

  private

  def announcement_params
    params.require(:announcement).permit(:title, :contents, :date)
  end
end
