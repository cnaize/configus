module Configus
  autoload :Version, "configus/version"
  autoload :Proxy, "configus/proxy"
  autoload :Config, "configus/config"
  autoload :Builder, "configus/builder"
  autoload :Attributes, "configus/attributes"
  autoload :KernelMixin, "configus/kernel_mixin"

  class << self
    def build(environment, &block)
      @config = Builder.build environment, &block
      Kernel.send :include, KernelMixin
      @config
    end

    def config
      @config
    end
  end
end
