require 'spec_helper'

describe MultaArcana do
  it "reports version" do
    MultaArcana::VERSION.should_not be_nil
  end

  it "loads secrets" do
    MultaArcana::secret_for(:foo).should == "FooSecret"
  end
end
