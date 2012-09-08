class Configus::Builder
  class << self
    def build(environment, &block)
      builder = new environment, &block
      builder.build_config
    end
  end

  def initialize(environment, &block)
    @current_env = environment
    @envs = {}
    instance_eval &block
  end

  def env(name, &block)
    proxic = Configus::Proxic.new
    proxic.instance_eval &block
    attrs = proxic.attrs
    @envs[name] = attrs
  end

  def build_config
    current_attrs = @envs.fetch @current_env, nil
    Configus::Config.new current_attrs
  end
end