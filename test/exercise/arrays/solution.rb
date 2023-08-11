module Exercise
  module Arrays
    class << self
      def replace(array)
        maximum = maximum(array)
        array.map { |element| element.positive? ? maximum : element }
      end

      def maximum(array)
        maximum = array.first
        array.each { |element| maximum = element if element > maximum }
        maximum
      end

      def search(array, query, low = 0, high = array.size - 1)
        return -1 if array.size.zero? || array.first > query || array.last < query
        return -1 if low > high

        mid = (low + high) / 2

        return mid if array[mid] == query

        query < array[mid] ? search(array, query, low, mid - 1) : search(array, query, mid + 1, high)
      end
    end
  end
end
