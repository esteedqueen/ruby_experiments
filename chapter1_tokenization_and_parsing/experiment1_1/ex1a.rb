require 'ripper'   # class Ripper (a tool that makes it easy to see what tokens ruby creates for different files) [Ripper](http://ruby-doc.org/stdlib-2.3.1/libdoc/ripper/rdoc/Ripper.html)
require 'pp'       # class pretty printer for ruby objects [PP](https://ruby-doc.org/stdlib-2.3.1/libdoc/pp/rdoc/PP.html)
code = <<STR
10.times do |n|
  puts n
end
STR
puts code
pp Ripper.lex(code)