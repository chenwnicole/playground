# Metaprogramming Ruby

## Part I: Metaprogramming Ruby
### Chapter 1: The M Word
- Language constructs: variables, functions, etc.
```ruby
class Movie < ActiveRecord::Base
end

movie = Movie.create
movie.title = "Doctor Strangelove" 
movie.title # => "Doctor Strangelove"
```
- Metaprogramming! `title`/`title=` aren't defined anywhere
- `ActiveRecord::Base` reads the schema at runtime and defines accessor methods for the attributes (example of writing into language constructs)
- Metaprogramming is writing code that manipulates language constructs at runtime
  - This requires constructs to exist at runtime (e.g. not C++)

### Chapter 2: The Object Model
#### Open Classes
```
# object_model/alphanumeric.rb
def to_alphanumeric(s)
  s.gsub(/[^\w\s]/, '')
end

class String
  def to_alphanumeric
    gsub(/[^\w\s]/, '') end
end
```
- Ask `String` to convert itself rather than passing it through an external method!

```
class D
  def x; 'x'; end
end
class D
  # Reopens class D
  def y; 'y'; end
end

obj = D.new
obj.x # => "x"
obj.y # => "y"
```
- Ruby is Open Class - it creates classes that don't yet exist or reopens it
```
require "monetize"
bargain_price = Monetize.from_numeric(99, "USD")
bargain_price.format # => "$99.00"

# Example open class use case
require "monetize"
standard_price = 100.to_money("USD")
standard_price.format # => "$100.00"

# gems/monetize-1.1.0/lib/monetize/core_extensions/numeric.rb
class Numeric
  def to_money(currency = nil)
    Monetize.from_numeric(self, currency || Money.default_currency) end
end
```
- The dark side to Open Class: mistakenly overwriting original methods (Monkeypatch: changing the features of an existing class)

#### Inside the Object Model
- There's no connection between an object's class and its instance variables in Ruby. Objects of the same class could have different instance variable keys/values (think of instance variables like values in a hash)
- Things: instance variables, methods, classes, modules, constants
- An object's instance variables live in itself, and methods live in the class
```
String.instance_methods == "abc".methods # => true String.methods == "abc".methods # => false
```
- Classes themselves are also objects. Class inherits from Module (superclass)
- Modules are meant to be included, classes are meant to be instantiated
- Constants begin with an uppercase letter; different from variables due to scope

```Ruby
module M
  Y = 'a constant in M'
  Y # => "a constant in M"
  # start with :: for absolute path
  ::Y # => "a root-level constant"
end
```
- Use namespaces to avoid constant clashes

#### What Happens When You Call a Method?
