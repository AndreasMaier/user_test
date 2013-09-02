require 'spec_helper'

describe Cluster do
  describe "when not providing a name" do
    before { Cluster.new }

    it { should_not be_valid }
  end
end
