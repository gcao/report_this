require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

require 'report_this'
require 'report_this/config'
require 'report_this/array_report'

module ReportThis
  describe ArrayReport do
    before :each do
      @array = %w[one two three four five six]
      config = ReportThis::Config.new :page_size => 5
      @report = ArrayReport.new @array, config
    end
    
    it "header" do
      @report.header.should eql("<String>")
    end
    
    it "body" do
      @report.body.should eql("one\ntwo\nthree\nfour\nfive\n")
    end
  end
end
