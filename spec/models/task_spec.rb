require 'spec_helper'

describe "Task" do
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