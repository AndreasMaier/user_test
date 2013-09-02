class GalaxiesController < ApplicationController
  def show
    @galaxy = Galaxy.find(params[:id])

    @systems = @galaxy.solar_systems.paginate(page: params[:page], :per_page => 20)
  end
end
