#! /usr/bin/ruby

module Numbers
  class One < Number

    def initialize(number)
      super

      @rows = [" "]

      (0...2).each_with_index do |n, i|
        @rows << [" "] if i!=0
        (0...number).each do
          @rows << "|"
        end
      end

      @rows << " "
    end

  end
end
