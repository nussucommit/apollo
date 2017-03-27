class AnnouncementsController < ApplicationController
  # before_action :admin_user, only: [:create, :destroy, :update]

  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(announcement_params)
    if @announcement.save
      redirect_to announcements_path
      flash[:notice] = 'Announcement created!'
    else
      render 'new'
    end
  end

  def index
    @announcements = Announcement.order(created_at: :desc)
  end

  def edit
    @announcement = Announcement.find(params[:id])
  end

  def update
    @announcement = Announcement.find(params[:id])
    if @announcement.update_attributes(announcement_params)
      redirect_to announcements_path
      flash[:notice] = 'Announcement editted!'
    else
      render 'edit'
    end
  end

  def destroy
    if Announcement.find(params[:id]).destroy
      flash[:notice] = 'You accomplished a task!'
    else
      flash.now[:alert] = 'There was an error deleting the task. Try again.'
    end
  end

  private

  def announcement_params
    params.require(:announcement).permit(:title, :contents, :date)
  end

  def admin_user
    return unless current_user.username != 'admin'
    redirect_to(root_url)
    flash[:alert] = 'Access Denied'
  end
end
