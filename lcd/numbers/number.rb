module Numbers
  class Number

    attr_reader :rows

    def initialize(number = 2)
      @number = number
      @rows = []
    end

    private

    attr_reader :number

  end
end
