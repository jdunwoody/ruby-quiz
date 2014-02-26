#! /usr/bin/ruby

module Numbers
  class Zero < Number

    def initialize(number)
      super

      @rows = [" #{'-'*number} "]

      (0...2).each_with_index do |n, i|
        @rows << " #{' '*number} " if i!=0
        (0...number).each do
          @rows << "|#{' '*number}|"
        end
      end

      @rows << " #{'-'*number} "
    end

  end
end
