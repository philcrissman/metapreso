def describe(description, &block)
  ExampleGroup.new(block).evaluate!
end


class ExampleGroup
  def initialize(block)
    @block = block
  end

  def evaluate!
    instance_eval(&@block)
  end

  def it(intention, &block)
    block.call
  end
end

class Object
  def should
    PositiveAssertion.new(self)
  end

  def should_not
    NegativeAssertion.new(self)
  end
end

class PositiveAssertion
  def initialize(subject)
    @subject = subject
  end

  def ==(other)
    @subject == other
  end

  def method_missing(name, *args)
    if name =~ /^be_(\w+)$/
      @subject.send("#{$1}?")
    else
      super
    end
  end
end

class NegativeAssertion
  def initialize(subject)
    @subject = subject
  end

  def ==(other)
    @subject != other
  end

  def method_missing(name, *args)
    if name =~ /^be_(\w+)$/
      !@subject.send("#{$1}?")
    else
      super
    end
  end
end

