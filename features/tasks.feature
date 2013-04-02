Feature: Manage Task
  In order to manage my tasks
  As a user
  I want to be able to add, edit, delete and complete a task

  Scenario:
    Given I am on a blank todo list page
    Then I should know it is blank

  Scenario:
    Given I am on the todo list page with tasks
    Then all of the tasks are visible

  Scenario:
    Given I am on the todo list page
    When I add a task
    Then the added task should show

  Scenario:
    Given I am on the todo list page
    When I delete a task
    Then the task should be deleted

   Scenario:
    Given I am on the todo list page
    When I mark a task as complete
    Then the task should be marked as complete