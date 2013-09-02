require 'factory_girl'

FactoryGirl.define do
  factory :planet do
    sequence(:name){|n| "planet-#{n}" }
    sequence(:solar_system_id){|n| "solar_system-#{n}" }
  end
end
