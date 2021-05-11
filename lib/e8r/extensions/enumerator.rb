module E8R::Extensions::Enumerator
  # == Constants =============================================================

  # NOTE: Avoid creating constants in this scope as they could get mixed in

    # == Mixin Methods =========================================================

  def threaded(pool: nil, &block)
    E8R::Thread::Enumerator.new(self, pool: pool, &block)
  end

  def ractored(pool: nil, &block)
    E8R::Ractor::Enumerator.new(self, pool: pool, &block)
  end

  def async(&block)
    E8R::Async::Enumerator.new(self, &block)
  end
end
