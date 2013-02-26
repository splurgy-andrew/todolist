require 'spec_helper'

describe Example do
  context "make_name_capitalized" do
    it "should return the name with the first letter capitalized" do
      example = Example.new :name => "angela"
      example.make_name_capitalized.should eq "Angela"
    end
  end
end
