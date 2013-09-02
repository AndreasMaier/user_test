require 'spec_helper'

describe Planet do
  describe "when not providing a name" do
    before { Planet.new }

    it { should_not be_valid }
  end

  describe "when creating a planet" do
    it "also creates a planet resource for that planet" do
      planet = FactoryGirl.create(:planet)

      expect(PlanetResources.find_by_planet_id(planet)).to_not be_nil
    end
  end
end
