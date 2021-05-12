module E8R
  # == Module Methods =======================================================

  def self.version
    File.readlines(File.expand_path('../VERSION', __dir__)).first.chomp
  end

  def self.wait(obj, &block)
    if (block_given?)
      case (result = block.call(obj))
      when ::Async::Task
        result.wait
      else
        result
      end
    else
      case (obj)
      when ::Async::Task
        obj.wait
      else
        obj
      end
    end
  end
end

require_relative 'e8r/extensions'

require_relative 'e8r/async'
require_relative 'e8r/ractor'
require_relative 'e8r/thread'

E8R::Extensions.install!
