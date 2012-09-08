module Configus
  class Builder
    class << self
      def build(environment, &block)
        builder = new environment, &block
        builder.config
      end
    end

    def initialize(environment, &block)
      @current_env = environment
      @envs = {}
      @inheritance = {}
      instance_eval &block
    end

    def env(name, opts = {}, &block)
      @inheritance[name] = opts[:parent]
      @envs[name] = Configus::Proxy.build block
    end

    def config
      Configus::Config.new config_attrs
    end

  private
    def inheritance_hierarchy
      env = @current_env
      hierarchy = [@envs[env]]
      while parent = @inheritance[env]
        env = parent
        hierarchy << @envs[env]
      end

      hierarchy.reverse
    end

    def config_attrs
      inheritance_hierarchy.inject do |result, current|
        result.merge! current
      end
    end
  end
end