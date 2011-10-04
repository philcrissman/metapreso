# require this file in models that belong to the WP database
# use by adding:
#   acts_as_wordpress :table_name => 'wp_table_name', :primary_key => 'ID'
# to the model. 
# If the table name is the same as the #underscore name of the class, the :table_name option could be omitted
#

module Wordpress
  
  def acts_as_wordpress(options)
    
    establish_connection "wordpress_#{::Rails.env}".to_sym
    
    if options[:table_name]
      set_table_name options[:table_name]
    end
    
    if options[:primary_key]
      set_primary_key options[:primary_key]
    end
    
  end
  
end

ActiveRecord::Base.extend Wordpress
