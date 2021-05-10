class E8R::Asynchronized::Enumerator < ::Enumerator
  # == Constants ============================================================

  # == Extensions ===========================================================

  # == Properties ===========================================================

  attr_reader :parent

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

  def initialize(parent, &block)
    @parent = parent

    super(@parent.size) do |y|
      loop do
        y << wait_on(@parent.next, &block)
      end

    rescue StopIteration
      # Expected end condition.
    end
  end

  def map(&block)
    super do |e|
      wait_on(e, &block)
    end
  end

protected
  def wait_on(obj, &block)
    if (block_given?)
      case (result = block.call(obj))
      when Async::Task
        result.wait
      else
        result
      end
    else
      case (obj)
      when Async::Task
        obj.wait
      else
        obj
      end
    end
  end
end
