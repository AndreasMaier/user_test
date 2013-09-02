require_relative  "../helpers/universe_creator"

namespace :starrior do

  desc "Creates the whole hierarchy for the universe"
  task :create => :environment do
    Universe.destroy_all
    Cluster.destroy_all
    Galaxy.destroy_all
    SolarSystem.destroy_all
    Planet.destroy_all

    UniverseCreator.new.create
  end
end

