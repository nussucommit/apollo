class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    Place.create(params[:place])
  end

  def edit
    @places = Place.find(params[:place_id])
  end

  def update
    Place.update(params[:place])
  end

  def destroy
    Place.find(params[:place_id]).destroy
    redirect_to :index
  end

  private

  def place_params
    params.require(:place).permit(:name)
  end
end
