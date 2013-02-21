require 'spec_helper'

describe MultaArcana do
  it "reports version" do
    MultaArcana::VERSION.should_not be_nil
  end

  it "loads secrets manually" do
    MultaArcana::load_file(File.expand_path('../secrets.yml', __FILE__))
    MultaArcana::secret_for(:foo).should == "FooSecret"
    MultaArcana::secret_for('foo').should == "FooSecret"
  end

  it "loads inline" do
    fname = File.expand_path('../secrets.yml', __FILE__)
    MultaArcana::secret_for(:bar, fname).should == "BarSecret"
    MultaArcana::secret_for('bar').should == "BarSecret"
    MultaArcana::secret_for('not_there').should == nil
  end
end
