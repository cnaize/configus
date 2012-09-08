class Configus::Proxy < BasicObject
  attr_reader :attrs

  def initialize(block)
    @attrs = {}
    instance_eval &block
  end

  def method_missing(key, value = nil, &block)
    if value
      @attrs[key] = value
    else
      proxy = ::Configus::Proxy.new block
      @attrs[key] = proxy.attrs
    end
  end
end