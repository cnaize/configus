class Configus::Proxic < BasicObject
  attr_reader :attrs

  def initialize
    @attrs = {}
  end

  def method_missing(key, value = nil, &block)
    @attrs[key] = value
  end
end