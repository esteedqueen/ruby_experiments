This documents my notes and codes while playing around with the experiments in the Ruby under a Microscope Book by [Pat Shaughnessy](http://patshaughnessy.net/ruby-under-a-microscope)

## Prerequisites

To run the experiments locally, you're going to need:

  - Linux or OS X — Windows may work, but I'm running on OS X
  - Ruby, I'm running version  `2.3.1`

## Chapter by Chapter Summaries & Experiments
### Chapter 1 - Tokenization and Parsing

When you run any Ruby code, Ruby rips your code apart and puts it back together in different formats _three times!_

Between the time you run a Ruby code and the time you get an output, it goes through a long journey:

[Your ruby code] --> [Tokenize] --> [Parse] --> [Compile] --> [Yet Another Ruby Virtual Machine (YARV) instructions]

#### Tokens - _the words that make up the Ruby language_
When Ruby sees the texts/characters in your code, it tokenizes them.
It converts them into a series of tokens that it understands by scanning/stepping through the characters one at a time.

Ruby rips the characters/texts apart into integer tokens, keyword tokens, identifier tokens, operator tokens, etc.

Ruby continues to step through the code until it has tokenized the entire Ruby script.

This is done using the `parser_yylex` function in the _[parse.y](https://github.com/ruby/ruby/blob/trunk/parse.y)_ C file

Initially, I thought the _parse.y_ file was available locally in my machine until I found out via this [StackOverflow's question](http://stackoverflow.com/questions/34226853/where-can-i-find-rubys-parse-y-file-on-my-system) that it's available in the [Ruby source code](https://github.com/ruby/ruby/blob/trunk/parse.y). The _parse.y_ file is a grammar rule file C. It contains a series of rules for the Ruby parser engine.

##### Experiment 1-1 Using Ripper to Tokenize Ruby Scripts
The Ripper class is a tool that makes it easy to see the tokens Ruby creates for different files. It allows you to call the same tokenization and parsing code that Ruby uses to process text from code files. The Ripper class is available in Ruby version `1.9` and `2.x`.

To see the output from Ripper on the ruby files in this repo, run:

```
$ ruby ex1a.rb

$ ruby ex1b.rb

$ ruby ex1c.rb
```

_Output from running `$ ruby ex1b.rb`_

```

def add_binary(a,b)
  s = a + b
  s.to_s(2)
end

p add_binary(3,4)
[[[1, 0], :on_kw, "def"],
 [[1, 3], :on_sp, " "],
 [[1, 4], :on_ident, "add_binary"],
 [[1, 14], :on_lparen, "("],
 [[1, 15], :on_ident, "a"],
 [[1, 16], :on_comma, ","],
 [[1, 17], :on_ident, "b"],
 [[1, 18], :on_rparen, ")"],
 [[1, 19], :on_ignored_nl, "\n"],
 [[2, 0], :on_sp, "  "],
 [[2, 2], :on_ident, "s"],
 [[2, 3], :on_sp, " "],
 [[2, 4], :on_op, "="],
 [[2, 5], :on_sp, " "],
 [[2, 6], :on_ident, "a"],
 [[2, 7], :on_sp, " "],
 [[2, 8], :on_op, "+"],
 [[2, 9], :on_sp, " "],
 [[2, 10], :on_ident, "b"],
 [[2, 11], :on_nl, "\n"],
 [[3, 0], :on_sp, "  "],
 [[3, 2], :on_ident, "s"],
 [[3, 3], :on_period, "."],
 [[3, 4], :on_ident, "to_s"],
 [[3, 8], :on_lparen, "("],
 [[3, 9], :on_int, "2"],
 [[3, 10], :on_rparen, ")"],
 [[3, 11], :on_nl, "\n"],
 [[4, 0], :on_kw, "end"],
 [[4, 3], :on_nl, "\n"],
 [[5, 0], :on_ignored_nl, "\n"],
 [[6, 0], :on_ident, "p"],
 [[6, 1], :on_sp, " "],
 [[6, 2], :on_ident, "add_binary"],
 [[6, 12], :on_lparen, "("],
 [[6, 13], :on_int, "3"],
 [[6, 14], :on_comma, ","],
 [[6, 15], :on_int, "4"],
 [[6, 16], :on_rparen, ")"],
 [[6, 17], :on_nl, "\n"]]
```

*N.B* Ripper doesn't detect syntax errors

