module Configus
  autoload :Version, "configus/version"
  autoload :Proxy, "configus/proxy"
  autoload :Config, "configus/config"
  autoload :Builder, "configus/builder"

  class << self
    def build(environment, &block)
      Builder.build environment, &block
    end
  end
end
