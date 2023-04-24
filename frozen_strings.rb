# frozen_string_literal: true

# https://stackoverflow.com/a/55900180

one = 'hello'
two = 'hello'

# outputs same id, better performance
p "one: #{one.object_id}"
p "two: #{two.object_id}"

# raises can't modify frozen String: "hello" (FrozenError)
one << ' world'
