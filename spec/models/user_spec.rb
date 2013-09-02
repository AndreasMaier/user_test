require 'spec_helper'

describe User do
  let!(:user) { User.create(email: "some@some.com", password: "foobar12") }

  describe "when creating a user" do
    it "assigns at least one planet to the user" do
      expect(user.planets).to_not be_empty
    end
  end

  describe "#current_planet" do
    describe "when there are no planets" do
      it "raises an exception" do
        expect(user.current_planet).to raise_error
      end
    end

    describe "when there was no planet visited before" do
      it "returns the first planet of the players planet list" do
        first_planet = user.planets.first
        user.planets << FactoryGirl.create(:planet)

        expect(user.current_planet).to eq(first_planet)
      end
    end

    describe "when there is a visited planet" do
      it "returns the first planet of the players planet list" do
        current = FactoryGirl.create(:planet)
        user.planets << current
        user.planets << FactoryGirl.create(:planet)
        user.visit_planet(current)

        expect(user.current_planet).to eq(current)
      end
    end
  end

  describe "#current_planet_resources" do
    describe "when there are no planets" do
      it "raises an exception" do
        expect(user.current_planet_resources).to raise_error
      end
    end

    describe "when there are planets" do
      it "returns the resources of the current planet" do
        expect(user.current_planet_resources).to_not be_nil
      end
    end
  end
end
