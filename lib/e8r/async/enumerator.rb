class E8R::Async::Enumerator < ::Enumerator
  # == Constants ============================================================

  # == Extensions ===========================================================

  # == Properties ===========================================================

  attr_reader :parent

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

  def initialize(parent, &block)
    @parent = parent

    @finished = Async::Condition.new

    super(@parent.size) do |y|
      # FIX: This needs to pass `y` to block where no parent is given
      loop do
        y << wait_on(@parent.next, &block)
      end

    rescue StopIteration
      # Expected end condition.
    end

    @finished.signal
  end

  def map(&block)
    super do |e|
      wait_on(e, &block)
    end
  end

  def wait
    @finished.wait
  end

protected
  def wait_on(obj, &block)
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
