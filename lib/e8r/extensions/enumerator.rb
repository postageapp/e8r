module E8R::Extensions::Enumerator
  # == Constants =============================================================

  # NOTE: Avoid creating constants in this scope as they could get mixed in

    # == Mixin Methods =========================================================

  def threaded(pool: nil, &block)
    E8R::Thread::Enumerator.for(self, pool: pool, &block)
  end

  def ractored(pool: nil, &block)
    E8R::Ractor::Enumerator.for(self, pool: pool, &block)
  end

  def async(parallel: nil, &block)
    E8R::Async::Enumerator.for(self, parallel: parallel, &block)
  end
end
