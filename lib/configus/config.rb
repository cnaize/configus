class Configus::Config
  def initialize(attrs)
    @attrs = attrs
    @attrs.each_pair do |k, v|
      define_singleton_method k do
        v
      end
    end
  end
end