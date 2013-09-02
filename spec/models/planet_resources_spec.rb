require 'spec_helper'

describe PlanetResources do

  it { should respond_to(:resources) }

  describe "when it is not associated with a planet id" do
    before { PlanetResources.new }
    it { should_not be_valid }
  end

  describe "when it is associated with a planet id" do
    let(:planet_resources) { FactoryGirl.create(:planet_resources) }
    it { planet_resources.should be_valid }
  end

  describe "#resources" do
    it "returns the updated resources" do
      Timecop.freeze(Time.now)
      pr = FactoryGirl.create(:planet_resources,
                              population: 1000.0,
                              metal: 100.0,
                              metal_rate: 100.0,
                              uranium: 50.0,
                              uranium_rate: 25.0,
                              arplax: 200.0,
                              arplax_rate: 20.0,
      )

      Timecop.travel(Time.now + 1.hour)

      resources = pr.resources

      expect(resources.population).to be_within(0.1).of(2000.0)
      expect(resources.metal).to be_within(0.1).of(200.0)
      expect(resources.uranium).to be_within(0.1).of(75.0)
      expect(resources.arplax).to be_within(0.1).of(220.0)

      Timecop.return
    end
  end
end
