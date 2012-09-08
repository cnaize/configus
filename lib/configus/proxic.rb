class Configus::Proxic < BasicObject
  attr_reader :attrs

  def initialize
    @attrs = {}
  end

  def method_missing(key, value)
    @attrs[key] = value
  end
end