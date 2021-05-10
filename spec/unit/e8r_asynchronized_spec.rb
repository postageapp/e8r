RSpec.describe E8R::Asynchronized, type: :reactor do
  describe 'extends Enumerator' do
    describe 'to iterate over an Enumerator using an Async block' do
      it 'that returns an Async::Task' do
        list = %w[ a b c d e f g ]

        captured = [ ]

        enumerator = list.each.asynchronized do |v|
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

      it 'to convert an enumerator to an Async version' do
        list = %w[ a b c d e f g ]

        remapped = list.each.asynchronized.map do |v|
          Async do |task|
            v + '!'
          end
        end

        expect(remapped).to eq(list.map { |v| v + '!' })
      end

      it 'that returns an object' do
        list = %w[ a b c d e f g ]

        captured = [ ]

        enumerator = list.each.asynchronized do |v|
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

  end
end
