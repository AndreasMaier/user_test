require 'spec_helper'

describe SolarSystem do
  describe "when not providing a name" do
    subject { SolarSystem.new }

    it { should_not be_valid }
  end
end
