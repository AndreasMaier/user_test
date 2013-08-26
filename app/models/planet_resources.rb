class PlanetResources < ActiveRecord::Base
  belongs_to :planet

  validates :planet_id, presence: true

  def 
end
