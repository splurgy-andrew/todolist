require 'spec_helper'

describe "Task" do
  context "model test" do
    it "cannot be updated when marked as complete" do
      task = Task.new({
        :title => "rspec test",
        :completed => true,
        :position => 1,
        :due_date => (Date.today - 1),
        :category => "work"
      })
      task.update_attributes({:title => "rspec test edited"})
      task.save.should be_false
    end

    it "can be updated if not completed" do
      task = Task.new({
        :title => "rspec test",
        :completed => false,
        :position => 1,
        :due_date => (Date.today + 1),
        :category => "work"
      })
      task.update_attributes({:title => "rspec test edited"})
      task.save.should be_true
    end

    it "does not validate due_date on completed tasks" do
      task = Task.new({
        :title => "rspec test",
        :completed => true,
        :position => 1,
        :due_date => (Date.today - 1),
        :category => "work"
      })
      task.valid?.should be_true
    end

    it "does not validate blank due_date field" do
      task = Task.new({
        :title => "rspec test",
        :completed => false,
        :position => 1,
        :due_date => nil,
        :category => "work"
      })
      task.valid?.should be_false
    end

    it "does validate future dates as for due_date field" do
      task = Task.new({
        :title => "rspec test",
        :completed => false,
        :position => 1,
        :due_date => Date.today + 1,
        :category => "work"
      })
      task.valid?.should be_true
    end

    it "does not validate past dates as for due_date field" do
      task = Task.new({
        :title => "rspec test",
        :completed => false,
        :position => 1,
        :due_date => Date.today - 1,
        :category => "work"
      })
      task.valid?.should be_false
    end

    it "does not validate yesterday for due_date field" do
      task = Task.new({
        :title => "rspec test",
        :completed => false,
        :position => 1,
        :due_date => Date.today - 1,
        :category => "work"
      })
      task.valid?.should be_false
    end

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

    it "does not validate 'test' for category" do
      task = Task.new({
          :title => "rspec test",
          :completed => false,
          :position => 1,
          :due_date => Date.today + 1,
          :category => "test"
      })
      task.valid?.should be_false
    end

    it "validates category as 'work' " do
      task = Task.new({
        :title => "rspec test",
        :completed => false,
        :position => 1,
        :due_date => Date.today + 1,
        :category => "work"
      })
      task.valid?.should be_true
    end

    it "validates category as 'personal' " do
      task = Task.new({
       :title => "rspec test",
       :completed => false,
       :position => 1,
       :due_date => Date.today + 1,
       :category => "personal"
      })
      task.valid?.should be_true
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