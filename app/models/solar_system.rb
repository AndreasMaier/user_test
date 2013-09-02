class SolarSystem < ActiveRecord::Base
  belongs_to :galaxy

  has_many :planets

  validates :name, :galaxy, presence: true
end
