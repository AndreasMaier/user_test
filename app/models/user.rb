class User < ActiveRecord::Base
  has_many :planets

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def current_planet
    raise "Player '#{email}' has no planets!" unless planets

    @current_planet ||= planets.first
  end

  def visit_planet(planet)
    @current_planet = planet
  end
end
