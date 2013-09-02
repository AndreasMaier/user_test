class PlanetResources < ActiveRecord::Base
  belongs_to :planet

  validates :planet_id, presence: true

  def resources
    update_resources

    PlanetResource.new({
        population: population,
        metal: metal,
        uranium: uranium,
        arplax: arplax
    })
  end

  private

  def population=(value)
    super
  end

  def population
    super.to_f
  end

  def metal=(value)
    super
  end

  def metal
    super.to_f
  end

  def uranium=(value)
    super
  end

  def uranium
    super.to_f
  end

  def arplax=(value)
    super
  end

  def arplax
    super.to_f
  end

  def update_resources
    old_attr = attributes.clone
    PlanetResources.transaction do
      time_diff = time_diff_in_hours
      update_attribute("population", calculate_population_diff(old_attr["population"], time_diff ))
      update_attribute("metal", old_attr["metal"] + metal_rate * time_diff)

      if uranium_rate > 0.0
        update_attribute "uranium", old_attr["uranium"] + uranium_rate * time_diff
      end

      if arplax_rate > 0.0
        update_attribute "arplax", old_attr["arplax"] + arplax_rate * time_diff
      end
    end
  end

  def time_diff_in_hours
    (Time.now - updated_at) / 3600 # seconds to hours
  end

  def calculate_population_diff(old_value, time_diff)
    old_value + (1000*time_diff)
  end
end
