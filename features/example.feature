Feature: Title Check
  In order to make sure we are on the right page
  The displayed title of the page should match what was specified as the title

  Scenario: Verify on index page
    Given I am on the index page
    Then I should be on the page with the heading: "Index"

  Scenario: Verify on About page
    Given I am on the about page
    Then I should be on the page with the heading: "About"
