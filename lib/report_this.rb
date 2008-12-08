module ReportThis
  module InstanceMethods
    def report config = nil
      self.class.report_class.new(self, config)
    end
  end
  
  module ClassMethods
    def report_class klass = 'NOT SET'
      if klass == 'NOT SET'
        if @report_class
          if @report_class.is_a? Class
            @report_class
          else
            @report_class = @report_class.to_s.constantize
          end
        else 
          @report_class = default_report_class
        end
      else
        @report_class = klass
      end
    end
    
    private 
    
    def default_report_class
      begin
        (self.to_s + "Report").constantize
      rescue NameError
        ReportThis::Base
      end
    end
  end
  
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.extend(ClassMethods)
  end
end

Object.send(:include, ReportThis)