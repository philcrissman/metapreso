module Something
  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def acts_as_something
      cattr_accessor :something_neat
      has_many :somethings
      send :include, InstanceMethods
    end
  end
  
  module InstanceMethods
    def do_something
      # something happens
    end
  end
end

ActiveRecord::Base.send :include, Something



# equivalently, could be done without the included hook:
#
module LessComplicated
  def acts_less_complicated
    cattr_accessor :something_simple
    has_many :leatherbound_books
    include InstanceMethods
  end

  module InstanceMethods
    def do_something
      # something happens
    end
  end
end

ActiveRecord::Base.extend LessComplicated

# see http://yehudakatz.com/2009/11/12/better-ruby-idioms/
