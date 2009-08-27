require File.dirname(__FILE__) + '/spec_helper'

require 'report_this'
require 'report_this/base'
require 'report_this/array_report'

describe ReportThis do
  it "should add report_class method to Object class" do
    Object.respond_to?(:report_class).should be_true
  end
  
  it "should add report method to Object instance" do
    Object.new.respond_to?(:report).should be_true
  end
  
  it "report_class sets class to use" do
    class TestReport; end
    Object.report_class 'TestReport'
    Object.report_class.should == TestReport
  end
  
  it "report_class returns custom report class" do
    class TestClass; end
    class TestClassReport; end
    TestClass.report_class.should == TestClassReport
  end
  
  it "report_class returns default report class" do
    class TestClass1; end
    TestClass1.report_class.should == ReportThis::Base
  end
  
  it "default report class for Array is ReportThis::ArrayReport" do
    Array.report_class.should == ReportThis::ArrayReport
  end
  
  it "default report class for Array is ::ArrayReport if exists" do
    class ArrayReport; end
    Array.report_class.should == ::ArrayReport
  end
end