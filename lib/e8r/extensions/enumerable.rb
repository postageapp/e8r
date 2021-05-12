module E8R::Extensions::Enumerable
  # == Constants =============================================================

  # NOTE: Avoid creating constants in this scope as they could get mixed in

  # == Mixin Methods =========================================================

  def threaded(pool: nil, &block)
    if (block_given?)
      E8R::Thread::Enumerator.for(each, pool: pool, &block)
    else
      E8R::Thread::Enumerator.for(each, pool: pool, &block).each(&block)
    end
  end

  def ractored(pool: nil, &block)
    if (block_given?)
      E8R::Ractor::Enumerator.for(each, pool: pool, &block)
    else
      E8R::Ractor::Enumerator.for(each, pool: pool, &block).each(&block)
    end
  end

  def async(parallel: nil, &block)
    if (block_given?)
      E8R::Async::Enumerator.for(each, parallel: parallel).each(&block)
    else
      E8R::Async::Enumerator.for(each, parallel: parallel)
    end
  end
end
