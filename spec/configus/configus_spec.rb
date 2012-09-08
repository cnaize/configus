require "spec_helper"

describe Configus do
  before do
    @config = Configus.build :development do
      env :development do
        email 'cool@email.com'
        settings do
          server 'cool.serv.com'
        end
      end
    end
  end

  it "key - value" do
    @config.email.should eq 'cool@email.com'
  end

  it "nested" do
    @config.settings.server.should eq 'cool.serv.com'
  end
end