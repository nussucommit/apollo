class PlacesController < ApplicationController
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

  private
    def place_params
      params.require(:place).permit(:name)
    end

end
