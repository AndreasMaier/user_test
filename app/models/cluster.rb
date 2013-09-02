class Cluster < ActiveRecord::Base
  belongs_to :universe

  has_many :galaxies

  validates :name, :universe, presence: true
end
