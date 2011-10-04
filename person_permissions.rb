class Person
  attr_accessor :permissions

  def initialize
    @permissions = Permissions.new
  end

end

class Permissions
  def can_create_resources?
    false
  end

  def can_edit_resources?
    true
  end

  def can_manage_users?
    false
  end
end

class Person
  def method_missing(name, *args)
    if permissions.respond_to?(name)
      permissions.send name, *args
    else
      puts '',"Oops. Can't find a way to do the action #{name.to_s}",''
      super
    end
  end
end
