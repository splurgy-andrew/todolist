Given /^I am on the \b([0-9a-z]+)\b page$/i do |title|
  visit "/example/#{title}"
end

Then /^I should be on the page with the heading: "([^"]*)"$/ do |title|
  page.should have_content(title)
end