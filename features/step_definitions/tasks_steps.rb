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
  visit '/tasks/new'
  page.should have_content ("Title")
  page.should have_content ("Completed")
  page.should have_content ("Position")
  page.should have_content ("Due Date")
  Task.create!(:title => "Finish cucumber tests", :position => 100,
               :completed => false, :due_date => Date.today)
end

Then /^the added task should show/i do
  visit '/tasks/'
  task = Task.find_by_position(100)
  page.should have_content (task.title)
end

When /^I delete a task/i do
  task = Task.create!(:title => "Finish cucumber tests", :position => 1,
                      :completed => false, :due_date => Date.today)
end

Then /^the deleted task should not show/i do
  task = Task.find_by_position(1)
  task.delete
  visit '/tasks/'
  page.should_not have_content(task.title)
  page.should have_content ('there is nothing here, add a task')
end

When /^I mark a task as complete/i do
  task = Task.create!(:title => "Finish cucumber tests", :position => 1337,
                      :completed => false, :due_date => true)
  task.update_attribute(:completed, true)
end

Then /^the task should be marked as complete/i do
  task = Task.find_by_position(1337)
  visit '/tasks/'
  page.should have_content (task.title)
  page.should have_content ("true")
end