class Planet < ActiveRecord::Base
  belongs_to :user
  belongs_to :solar_system

  after_save :create_resources
  has_one :planet_resources, dependent: :destroy

  validates :name, :solar_system_id, presence: true

  def self.select_free_planet(user)
    Planet.transaction do
      planet = Planet.where( user_id: nil).sample
      planet.update_attribute(:user_id, user)
      planet
    end
  end

  private

  def create_resources
    self.planet_resources = PlanetResources.create
  end
end
