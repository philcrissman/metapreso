class Something
  attr_accessor :name

  def b
    binding
  end
end


class SomethingDifferent
  attr_accessor :name

  def do_something(scope)
    yield scope
  end

end

# 
# s = Something.new
# s.name = "Fred"
# sd = SomethingDifferent.new
# sd.name = "Barney"
#
# b = s.b
#
# sd.do_something(b) do |scope|
#   eval 'puts "Hello, #{name}", scope
# end
#
