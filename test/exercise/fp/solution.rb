module Exercise
  module Fp
    class << self
      def rating(array)
        result = array.map do |film|
          film['rating_kinopoisk'].to_f if !film['country'].nil? &&
                                           film['country'].split(',').size > 1 &&
                                           film['rating_kinopoisk'].to_f.positive?
        end.compact
        result.reduce(:+) / result.size
      end

      def chars_count(films, threshold)
        result = films.map do |film|
          film['name'].chars.select { |char| char == 'и' }.size if film['rating_kinopoisk'].to_f.positive? &&
                                                                   film['rating_kinopoisk'].to_f >= threshold
        end.compact
        result.reduce(:+)
      end
    end
  end
end
