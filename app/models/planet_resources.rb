class PlanetResources < ActiveRecord::Base
  belongs_to :planet

  validates :planet_id, presence: true

  attr_reader :population, :metal, :uranium, :arplex

  def get_population
    @population
  end

  def get_metal
    puts 'get_metal'
    update_resources
    metal
  end

  def get_uranium
    @uranium
  end

  def get_arplax
    @arplex
  end

  private

  def update_resources
    @metal = metal
  end

  def time_diff

  end
end
