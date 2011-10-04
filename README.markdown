BETTER LIVING THROUGH META-PROGRAMMING
======================================

These are the slides and example files used for the MDC 2011
presentation I did on metaprogramming.

Most of the material of interest is in the .rb files:

Open classes:
* Adding new methods to an existing class: see `ord.rb` (the String class)
* Overriding existing methods: see `apples_and_oranges.rb` (we override
  `==`)

Hook methods:
* `inherited` and `at_exit` in `testy_testy.rb` and `some_test.rb`
* `included` example in `apples_and_oranges.rb`
* a bit about the included idiom as used in rails `acts_as` style
  plugins, in `acts_as_something.rb`

Method missing:
* friendlier errors and delegation: `person_permissions.rb`
* flexible apis: see the Array class in `ord.rb`
* more on flexible apis: look up how ActiveRecord handles methods like
  `find_by_name_and_email_and_age`, etc.

DSLs
* an rspec-like thing: `specky.rb` (based off a [Gary Bernhardt
  screencast](https://www.destroyallsoftware.com/screencasts/catalog/building-rspec-from-scratch))

Ruby macros:
* something that works like `attr_accessor`, but accepts a block with an
  initial value for the attribute: `object_accessor.rb`

That's about it. Take a look through the slides, try to run and
understand the example files, and play around with classes and objects
in irb.

Also in the repo is Paul Cantrell's
[closures-in-ruby.rb](http://innig.net/software/ruby/closures-in-ruby.rb),
which I never got around to talking about in the presentation, but which is really interesting, and which
you'll probably enjoy if you like this sort of thing.
