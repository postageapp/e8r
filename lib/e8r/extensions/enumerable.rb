module E8R::Extensions::Enumerable
  def threadified(&block)
    E8R::Threadified.new(each, &block)
  end

  def ractorized(&block)
    E8R::Ractorized.new(each, &block)
  end

  def asynchronized(&block)
    E8R::Asynchronized.new(each, &block)
  end
end
