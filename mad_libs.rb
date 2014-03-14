#! /usr/bin/ruby

#encoding utf-8

class MadLib

end

class UserInput

  def request_story
    puts('Give me a story including ((place_holder))')
    gets
  end

  def request_placeholder_choices(placeholders)
    placeholders.each do |placeholder|
      puts('Give me a #{placeholder}')
      gets
    end
  end

end

class StoryParser

  def parse(story_text)
    Story.new(story_text)
  end

end

Placeholder = Struct.new(:placeholder_option, :placeholder_choice)

class Story

  attr_reader :text, :placeholders

  def initialize(text)
    @text = text
    @placeholders = []
  end

  def add_placeholder(placeholder)
    placeholders << placeholder
  end

  private

  attr_reader :placeholder

end

class StoryTeller

  attr_reader :story

  def initialize(story)
    @story = story
  end

  def output(story)
    puts "#{story.text}"
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

story.placeholders.each do |placeholder_option|
  placeholder_choice = user_input.request_placeholder_choice(placeholder_option)
  placeholder = PlaceHolder.new(placeholder_option, placeholder_choice)

  story.add_placeholder(placeholder)
end

story_teller = StoryTeller.new(story)

story_teller.output(story)


#def generate_story
#%Q{
#I had a ((place_holder)) sandwich for lunch today. It dripped all over my #{body_part} and #{noun}.
#}
#end
