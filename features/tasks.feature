Feature: Manage Task
  In order to manage my tasks
  As a user
  I want to be able to add, delete, and complete a task

  Scenario:
    Given I am on the todo list page
    Then all of the tasks show

  Scenario:
    Given I am on the todo list page
    When I add a task
    Then the added task should show

  Scenario:
    Given I am on the todo list page
    When I delete a task
    Then the deleted task should not show

   Scenario:
    Given I am on the todo list page
    When I mark a task as complete
    Then the task should be marked as complete