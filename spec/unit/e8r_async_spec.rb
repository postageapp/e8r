RSpec.describe E8R::Async, type: :reactor do
  describe 'extends Enumerator' do
    describe 'to iterate over an Enumerator using an Async block' do
      it 'that returns an Async::Task' do
        list = %w[ a b c d e f g ]

        captured = [ ]

        enumerator = list.each.async do |v|
          Async do |task|
            captured << v

            v
          end
        end

        expect(captured).to eq([ ])

        result = enumerator.to_a

        expect(result).to eq(list)
        expect(captured).to eq(list)
      end

      describe 'to convert an enumerator to an Async version' do
        it 'for a simple chained call' do
          list = %w[ a b c d e f g ]

          remapped = list.each.async.map do |v|
            Async do |task|
              v + '!'
            end
          end.to_a

          expect(remapped).to eq(list.map { |v| v + '!' })
        end

        it 'for a doubly chained call' do
          list = %w[ a b c d e f g ]

          remapped = list.each.async.map do |v|
            Async do
              v + '!'
            end
          end.map do |v|
            Async do
              v.upcase
            end
          end.to_a

          expect(remapped).to eq(list.map { |v| v.upcase + '!' })
        end
      end

      it 'to convert an enumerator to an Async version' do
        list = %w[ a b c d e f g ]

        remapped = list.each.async.map do |v|
          Async do |task|
            v + '!'
          end
        end.to_a

        expect(remapped).to eq(list.map { |v| v + '!' })
      end

      it 'that returns an object' do
        list = %w[ a b c d e f g ]

        captured = [ ]

        enumerator = list.each.async do |v|
          captured << v

          v
        end

        expect(captured).to eq([ ])

        result = enumerator.to_a

        expect(result).to eq(list)
        expect(captured).to eq(list)
      end
    end
  end

  describe 'extends Enumerable' do
    it 'to provide an Async aware iterator' do
      list = (1..10).to_a
      collected = [ ]

      list.async do |v|
        Async do
          collected << v * 2
        end
      end

      expect(collected).to eq(list.map { |v| v * 2 })
    end

    it 'to provide an Async aware enumerator' do
      list = %w[ a b c d e f g ]

      enumerator = list.async.map do |v|
        Async do
          v + Async do
            '!'
          end.wait
        end
      end

      result = enumerator.to_a

      expect(result).to eq(list.map { |v| v + '!' })
    end
  end
end
