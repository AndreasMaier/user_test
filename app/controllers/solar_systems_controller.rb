class SolarSystemsController < ApplicationController
  def show
    @system = SolarSystem.find(params[:id])

    @planets = @system.planets.paginate(page: params[:page], :per_page => 10)
  end
end
