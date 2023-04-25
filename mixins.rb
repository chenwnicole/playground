# https://www.geeksforgeeks.org/ruby-mixins/
# In Ruby, mixins are modules that a class an include or extend
# A class can have only one superclass but many mixins

# https://culttt.com/2015/07/08/working-with-mixins-in-ruby#:~:text=Ruby%20is%20a%20programming%20language,provides%20this%20functionality%20as%20Mixins.

module Greetings
  # https://www.ruby-lang.org/en/documentation/faq/8/#:~:text=What%20is%20the%20difference%20between%20a%20class%20and%20a%20module,instance%20state%20(instance%20variables).
  # modules cannot generate instances

  def self.included(base)
    # invoked on include
  end

  def hello
    puts 'Hello!'
  end
end

class Ian
  # add module methods as instance methods
  # Good: Ian.new.hello; Bad: Ian.hello
  include Greetings
end

class Elise
  # add module methods as class methods
  # Good: Elise.hello; Bad: Elise.new.hello
  extend Greetings
end
