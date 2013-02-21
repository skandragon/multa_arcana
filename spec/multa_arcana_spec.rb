require 'spec_helper'

describe MultaArcana do
  it "reports version" do
    MultaArcana::VERSION.should_not be_nil
  end
end
