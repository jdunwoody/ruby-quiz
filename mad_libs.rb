#! /usr/bin/ruby
#encoding utf-8

#require 'rubygems'
#require 'pry'

class MadLib

end

class UserInput

  def request_story
    puts("Give me a story including ((place_holder))")
    response = gets

    response.strip
  end

  def request_placeholder_choice(placeholder)
    puts("Give me a #{placeholder}")
    response = gets

    response.strip
  end

end

class StoryParser

  def parse(story_text)
    placeholder_keys = story_text.match(/((\(.*?\)))/)
    puts "keys #{placeholder_keys}"
    Story.new(story_text, Hash[placeholder_keys.zip([])] )
  end

  private

  def extract_placeholders
  end
end


class Story

  attr_reader :text, :placeholders

  def initialize(text, placeholders = {})
    @text = text
    @placeholders = placeholders
  end

  def add_placeholder_choice(option, choice)
    placeholders[options] = choice
  end

end

class StoryTeller

  attr_reader :story

  def initialize(story)
    @story = story
  end

  def output(story)
    puts story.text
    puts story.placeholders
    rendered_text = story.text.gsub(/((.*))/, story.placeholders)
    puts rendered_text
  end

end

class StoryBuilder

  def initialize(input_string)
    @input_string = input_string
  end

  def build
    StoryParser.new.parse(input_string)
  end

  private

  attr_reader :input_string

end

user_input = UserInput.new
input_string = user_input.request_story

story_builder = StoryBuilder.new(input_string)

story = story_builder.build

story.placeholders.keys.each do |option|
  story.placeholders[option] = user_input.request_placeholder_choice(option)
end

story_teller = StoryTeller.new(story)

story_teller.output(story)


#def generate_story
#%Q{
#I had a ((place_holder)) sandwich for lunch today. It dripped all over my #{body_part} and #{noun}.
#}
#end
