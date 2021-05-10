module E8R::Extensions::Enumerator
  def threadified(&block)
    E8R::Threadified::Enumerator.new(self, &block)
  end

  def ractorized(&block)
    E8R::Ractorized::Enumerator.new(self, &block)
  end

  def asynchronized(&block)
    E8R::Asynchronized::Enumerator.new(self, &block)
  end
end
