class Planet < ActiveRecord::Base
  belongs_to :user

  before_save :create_resources
  has_one :planet_resources, dependent: :destroy

  validates :name, presence: true

  private

  def create_resources
    self.planet_resources = PlanetResources.create
  end
end
