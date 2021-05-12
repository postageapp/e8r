class E8R::Async::Enumerator < ::Enumerator
  # == Constants ============================================================

  # == Extensions ===========================================================

  # == Properties ===========================================================

  attr_reader :parent

  # == Class Methods ========================================================

  def self.for(parent, parallel: nil, &block)
    new(parent, parallel: parallel) do |y|
      loop do
        # FIX: Use read index, conditionally write when sequenced
        y << E8R.wait(parent.next, &block)
      end

    rescue StopIteration
      # Expected end condition.
    end
  end

  # == Instance Methods =====================================================

  def initialize(parent, parallel: nil, &block)
    @parent = parent
    @parallel = parallel&.to_i

    super(@parent&.size, &block)
  end

  def map(&block)
    self.class.for(self, parallel: @parallel, &block)
  end

  def wait
    @finished.wait
  end
end
