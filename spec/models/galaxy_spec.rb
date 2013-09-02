require 'spec_helper'

describe Galaxy do
  describe "when not providing a name" do
    before { Galaxy.new }

    it { should_not be_valid }
  end
end
