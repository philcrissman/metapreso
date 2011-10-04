class Class
  def object_accessor(*names, &block)
    names.each do |name|
      define_method("#{name}=") do |value|
        instance_variable_set("@#{name}", value)
      end

      define_method("#{name}") do
        if instance_variables.include? :"@#{name}"
          instance_variable_get("@#{name}")
        else
          if block_given?
            instance_variable_set("@#{name}", block.call)
          else
            instance_variable_set("@#{name}", nil)
          end
        end
      end
    end
  end
end
