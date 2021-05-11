module E8R::Extensions::Enumerable
  # == Constants =============================================================

  # NOTE: Avoid creating constants in this scope as they could get mixed in

  # == Mixin Methods =========================================================

  def threaded(pool: nil, &block)
    E8R::Thread::Enumerator.new(each, &block)
  end

  def ractored(pool: nil, &block)
    E8R::Ractor::Enumerator.new(each, &block)
  end

  def async(&block)
    if (block_given?)
      E8R::Async::Enumerator.new(each).each(&block)
    else
      E8R::Async::Enumerator.new(each)
    end
  end
end
