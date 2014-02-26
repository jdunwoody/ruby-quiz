#! /usr/bin/ruby

module Numbers
  class Six < Number

    def initialize(number)
      super

      @rows = [" #{'-'*number} "]

      (0...number).each do
        @rows << "|#{' '*number} "
      end

      @rows << " #{'-'*number} "

      (0...number).each do
        @rows << "|#{' '*number}|"
      end

      @rows << " #{'-'*number} "
    end

  end
end
