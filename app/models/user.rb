class User < ActiveRecord::Base
  has_many :planets

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :colonize_planet

  def current_planet
    raise "Player '#{email}' has no planets!" unless planets

    @current_planet ||= planets.first
  end

  def current_planet_resources
    raise "Player '#{email}' has no planets!" unless planets

    current_planet.planet_resources.resources
  end

  def visit_planet(planet)
    @current_planet = planet
  end

  private

  def colonize_planet
    planet = Planet.create(name: "planet_#{Planet.count}")
    puts "colonizing planet '#{planet.id}' for user #{id}"
    planets << planet
  end
end
