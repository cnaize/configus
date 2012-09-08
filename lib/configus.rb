require "configus/version"
require "configus/proxic"
require "configus/config"
require "configus/builder"

module Configus
  class << self
    def build(environment, &block)
      Builder.build environment, &block
    end
  end
end
