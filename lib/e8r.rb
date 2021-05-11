module E8R
  def self.version
    File.readlines(File.expand_path('../VERSION', __dir__)).first.chomp
  end
end

require_relative 'e8r/extensions'

require_relative 'e8r/async'
require_relative 'e8r/ractor'
require_relative 'e8r/thread'

E8R::Extensions.install!
