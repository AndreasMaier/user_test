class Galaxy < ActiveRecord::Base
  belongs_to :cluster

  has_many :solar_systems

  validates :name, :cluster_id, presence: true
end
