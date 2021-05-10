module E8R
  def self.version
    File.readlines(File.expand_path('../VERSION', __dir__)).first.chomp
  end
end

require_relative 'e8r/extensions'

require_relative 'e8r/asynchronized'
require_relative 'e8r/ractorized'
require_relative 'e8r/threadified'

E8R::Extensions.install!
