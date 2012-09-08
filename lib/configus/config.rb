module Configus
  class Config
    def initialize(attrs)
      attrs.each_pair do |k, v|
        define_singleton_method k do
          v.kind_of?(Attributes) ? Configus::Config.new(v) : v
        end
      end
    end
  end
end