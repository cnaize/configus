require "spec_helper"

describe Configus do
  before do
    @email = 'cool@mail.com'

    @config = Configus.build :development do
      env :development do
        mail @email
      end
    end
  end

  it "should build config" do
    @config.mail.should eq @mail
  end
end