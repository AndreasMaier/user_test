class PlanetResource
  attr_reader :population, :metal, :uranium, :arplax

  def initialize(params)
    @population = params[:population]
    @metal = params[:metal]
    @uranium = params[:uranium]
    @arplax = params[:arplax]
  end

  def population
    @population
  end

  def metal
    @metal
  end

  def uranium
    @uranium
  end

  def arplax
    @arplax
  end
end
