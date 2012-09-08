require "spec_helper"

describe Configus do
  before do
    @config = Configus.build :development do
      env :production do
        house 'White House'
        cool_hash one: 1
      end

      env :development, parent: :production do
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

  it "inheritance" do
    @config.house.should eq 'White House'
  end

  it "hash" do
    @config.cool_hash[:one].should eq 1
  end
end