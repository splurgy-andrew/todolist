require 'spec_helper'

describe "Task" do
  context "model test" do

    it "has a default value for category field" do
      task = Task.new()
      task.category.should == "personal"
    end

    it "uses the parameters given" do
      task = Task.new({
        :title => "rspec test",
        :completed => false,
        :position => 1,
        :due_date => Date.today,
        :category => "work"
      })
      task.title.should == "rspec test"
      task.completed.should be false
      task.position.should be 1
      task.due_date.should == Date.today
      task.category.should == "work"
    end
  end

  context "overdue?" do
    it "returns true if the due date is past" do
      task = Task.new({
        :title => "rspec test",
        :completed => false,
        :position => 2,
        :due_date => Date.today - 1.day
      })
      task.overdue?.should be_true
    end

    it "returns false if the due date is in the future" do
      task = Task.new({
        :title => "rspec test",
        :completed => false,
        :position => 2,
        :due_date => Date.today + 2.days
      })
      task.overdue?.should be_false
    end

    it "returns false if the due date is today" do
      task = Task.new({
        :title => "rspec test",
        :completed => false,
        :position => 2,
        :due_date => Date.today
      })
      task.overdue?.should be_false
    end
  end
end