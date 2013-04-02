Given /^I am on a blank todo list page/i do
  visit '/tasks/'
end

Then /^I should know it is blank/i do
  page.should have_content('there is nothing here, add a task')
end

Given /^I am on the todo list page/i do
  visit '/tasks/'
  task = Task.new({
    :title => "rspec test",
    :completed => false,
    :position => 1,
    :due_date => (Date.today + 1),
    :category => "work"
  })
  task.save
end

Then /^all of the tasks are visible/i do
  visit '/tasks/' #refresh the page
  page.should have_content "rspec test"
end

When /^I add a task/i do
  visit '/tasks/new'
  page.should have_content "Title"
  page.should have_content "Completed"
  page.should have_content "Position"
  page.should have_content "Due Date"
  page.should have_content "Category"
  Task.create!(:title => "Finish cucumber tests", :position => 1,
               :completed => false, :due_date => Date.today)
end

Then /^the added task should show/i do
  visit '/tasks/'
  task = Task.find_by_position(1)
  page.should have_content (task.title)
end

When /^I delete a task/i do
  task = Task.create!(:title => "Finish cucumber tests", :position => 1,
                      :completed => false, :due_date => Date.today)
end

Then /^the task should be deleted/i do
  task = Task.find_by_position(1)
  task.delete
  visit '/tasks/'
  page.should_not have_content(task.title)
end

When /^I mark a task as complete/i do
  task = Task.create!(:title => "Finish cucumber tests", :position => 1337,
                      :completed => false, :due_date => Date.today)
  task.update_attribute(:completed, true)
end

Then /^the task should be marked as complete/i do
  task = Task.find_by_position(1337)
  visit '/tasks/'
  page.should have_content (task.title)
end