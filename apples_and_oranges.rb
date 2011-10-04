class FruitComparisonException < Exception
end

module FruitComparison
  attr_accessor :juicyness

  def self.included(base)
    base.instance_eval do
      def hello
        puts "Hello, from #{self.to_s}"
      end
    end

    base.class_eval do
      attr_accessor :worms
      def another_method
        puts "Another method!"
      end
    end
  end

  def initialize(j = 3)
    @juicyness = j
  end

  alias_method :old_eq, :==

  def ==(other_thing)
    klasses = [self.class, other_thing.class]
    if klasses.include?(Apple) && klasses.include?(Orange)
      raise FruitComparisonException, "Don't you know you can't compare apples and oranges?"
    elsif [self, other_thing].all?{|o| o.respond_to?(:juicyness)}
      self.juicyness == other_thing.juicyness
    else
      self.old_eq(other_thing)
    end
  end
end


class Apple
  include FruitComparison
end

class Orange
  include FruitComparison
end


