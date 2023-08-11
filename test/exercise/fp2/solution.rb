module Exercise
  module Fp2
    class MyArray < Array
      def my_each(&block)
        return self if size.zero?

        block.call(first)
        MyArray.new(self[1...size]).my_each(&block)
        self
      end

      def my_map(&block)
        MyArray.new(my_reduce([]) { |accumulator, element| accumulator << block.call(element) })
      end

      def my_compact
        MyArray.new(my_reduce([]) { |accumulator, element| element.nil? ? accumulator : accumulator << element })
      end

      def my_reduce(accumulator = nil, &block)
        return accumulator if size.zero?

        accumulator = accumulator.nil? ? first : block.call(accumulator, first)
        MyArray.new(self[1...size]).my_reduce(accumulator, &block)
      end
    end
  end
end
