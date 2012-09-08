require "spec_helper"

describe Configus do
  before do
    @config = Configus.build :development do
      env :development do
        email 'cool@email.com'
      end
    end
  end

  it "should build config" do
    @config.email.should eq 'cool@email.com'
  end
end