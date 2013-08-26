class PlanetsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @planets = Planet.paginate(page: params[:page], :per_page => 10)
  end

  def show
    @planet = Planet.find(params[:id])

    current_user.visit_planet @planet
  end
end
