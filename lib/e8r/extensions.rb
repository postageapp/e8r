module E8R::Extensions
  def self.install!
    E8R::Extensions::Enumerable.instance_methods.each do |name|
      ::Enumerable.define_method(name, E8R::Extensions::Enumerable.instance_method(name))
    end

    ::Enumerator.include(E8R::Extensions::Enumerator)
  end
end

require_relative 'extensions/enumerable'
require_relative 'extensions/enumerator'
