class TestyTesty
  class << self
    attr_accessor :failed_tests, :subclasses

    def inherited(child)
      @subclasses ||= []
      @subclasses << child
    end

    def run
      start = Time.now
      @failed_tests = []
      all_tests = @subclasses.map{|test| test.instance_methods.grep(/^test/) }.flatten
      @subclasses.each do |child|
        test_instance = child.new
        tests = test_instance.methods.grep(/^test/)

        tests.each do |m|
          if test_instance.send(m)
            print '.'
          else
            print 'F'
            @failed_tests << m
          end
        end
      end
      finish = Time.now
      puts '', '', "Finished in #{finish - start} seconds"
      puts '',"#{all_tests.count} tests: #{all_tests.count - @failed_tests.count} passed: #{@failed_tests.count} failed"
      puts '',"Failed tests: "
      @failed_tests.each{|f| puts "#{f.to_s}"}
    end
  end

  def assert(something)
    something == true
  end

  at_exit do
    unless $!
      TestyTesty.run
    end
  end
end
