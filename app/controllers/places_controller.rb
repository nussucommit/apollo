class PlacesController < ApplicationController
  def new
    @place = Place.new
  end

  def create
    Place.create(params[:place])
  end

  private
    def place_params
      params.require(:place).permit(:name)
    end

end
