Given /^I am on the todo list page/i do
  visit '/tasks/'
end

Then /^all of the tasks show/i do
  if Task.all.length == 0
    page.should have_content('there is nothing here, add a task')
  else
    page.should have_content('#<Task id')
  end
end

When /^I add a task/i do
  Task.create!(:title => "Finish cucumber tests", :position => 1, :completed => false)
end

Then /^the added task should show/i do
  visit '/tasks/'
  task = Task.find_by_position(1)
  page.should have_content (task.title)
end

When /^I delete a task/i do
  task = Task.create!(:title => "Finish cucumber tests", :position => 1, :completed => false)
end

Then /^the deleted task should not show/i do
  task = Task.find_by_position(1)
  task.delete
  visit '/tasks/'
  page.should_not have_content(task.title)
end

When /^I mark a task as complete/i do
  task = Task.create!(:title => "Finish cucumber tests", :position => 1, :completed => false)
  task.update_attribute(:completed, true)
end

Then /^the task should be marked as complete/i do
  task = Task.find_by_position(1)
  visit '/tasks/'
  page.should have_content (true)
end