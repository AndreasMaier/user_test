require 'factory_girl'

FactoryGirl.define do
  factory :planet do
    sequence(:name){|n| "planet-#{n}" }
  end
end
