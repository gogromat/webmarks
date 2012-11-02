require "spec_helper"

describe ApplicationHelper do

  describe "full_title" do

    it "should include the page title" do
      full_title("foo").should =~ /foo/
    end

    it "should include the base title" do
       full_title("foo").should =~ /^Webmarks/
       full_title("").should    =~ /Webmarks/
    end

    it "should have include a bar for the home page" do
      full_title("").should_not   =~ /\|/
    end
  end

  describe "add_http" do

    it "should add http" do
      addresses = %w[www.google.com www.1.com
                     1.com google.com kaka.ru 1.su me.w o.o www.o.o]
      addresses.each do |address|
        add_http(address).should =~ /^http:\/\//
      end
    end

    it "should not add http" do
      addresses = %w[http://dada.com  http://wwww.example.org
                     ftp://someweb.rg nikita://super.man]
      addresses.each do |address|
        add_http(address).should_not =~ /^http:\/\/[a-zA-Z]+:\/\//
      end
    end

  end

end