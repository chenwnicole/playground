# Metaprogramming Ruby

## Part I: Metaprogramming Ruby
### Chapter 1: The M Word
```ruby
class Movie < ActiveRecord::Base
end

movie = Movie.create
movie.title = "Doctor Strangelove" 
movie.title # => "Doctor Strangelove"
```
- Metaprogramming! title/title= aren't defined anywhere
- ActiveRecord::Base reads the schema at runtime and defines accessor methods for the attributes (example of writing into language constructs)
- Metaprogramming is writing code that manipulates language constructs at runtime
  - This requires constructs to exist at runtime (e.g. not C++)

### Chapter 2: The Object Model
