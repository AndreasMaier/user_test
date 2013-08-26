class Planet < ActiveRecord::Base
  belongs_to :user
  has_one :planet_resources

  validates :name, presence: true
end
