#! /usr/bin/ruby

require File.join(File.dirname(__FILE__), 'numbers', 'number')
require File.join(File.dirname(__FILE__), 'numbers', 'zero')
require File.join(File.dirname(__FILE__), 'numbers', 'one')
require File.join(File.dirname(__FILE__), 'numbers', 'two')
require File.join(File.dirname(__FILE__), 'numbers', 'three')

class LCD

  def initialize(size = 2)
    @size = size
    @numbers = build_numbers(size)
  end

  def to_s
    numbers = build_numbers(size)

    (0..(4*size)).map do |s|
      numbers.map do |number|
        number.rows[s]
      end.join(' ')
    end
  end

  private

  def build_numbers(size)
    [
      Numbers::Zero.new(size),
      Numbers::One.new(size),
      Numbers::Two.new(size),
      Numbers::Three.new(size),
    ]
  end

  attr_reader :numbers, :size

end

puts LCD.new(4).to_s
