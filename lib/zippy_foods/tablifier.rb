module ZippyFoods
  class Tablifier

    attr_reader :source

    def initialize(data)
      @source = shallow_copy(data)
    end

    def headings
      source.keys.sort
    end

    def row_count
      cols.map(&:size).max
    end

    def rows
      padding.zip(*cols).map { |pad_row| pad_row.drop(1) }
    end

    def table
      [headings, *rows]
    end

private

    def shallow_copy(data)
      result = {}
      data.each_pair do |heading, column|
        result[heading] = column.dup
      end
      result
    end

    def cols
      headings.map { |heading| source[heading] }
    end

    def padding
      (1 .. row_count).map { nil }
    end

  end
end
