require 'ripper'   # class Ripper (a tool that makes it easy to see what tokens ruby creates for different files) [Ripper](http://ruby-doc.org/stdlib-2.3.1/libdoc/ripper/rdoc/Ripper.html)
require 'pp'       # class pretty printer for ruby objects [PP](https://ruby-doc.org/stdlib-2.1.1/libdoc/pp/rdoc/PP.html)
code = <<STR
def add_binary(a,b)
  s = a + b
  s.to_s(2)
end

p add_binary(3,4)
STR
puts code
pp Ripper.lex(code)