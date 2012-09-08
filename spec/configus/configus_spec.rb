require "spec_helper"

describe Configus do
  it "should have method build" do
    Configus.respond_to?(:build).should be_true
  end
end