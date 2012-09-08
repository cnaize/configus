class Configus::Builder
  class << self
    def build(environment, &block)
      builder = new environment, &block
      builder.config
    end
  end

  def initialize(environment, &block)
    @current_env = environment
    @envs = {}
    instance_eval &block
  end

  def env(name, &block)
    proxy = Configus::Proxy.new block
    @envs[name] = proxy.attrs
  end

  def config
    current_attrs = @envs.fetch @current_env, nil

    #Configus::Config.new current_attrs
  end
end