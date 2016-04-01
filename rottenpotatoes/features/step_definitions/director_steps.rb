Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  fail "Unimplemented"
end

Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |arg1, arg2|
  assert page.body =~ /#{arg1}.+Director.+#{arg2}/m
  # express the regexp above with the code you wish you had
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  assert page.body =~ /#{e1}.+#{e2}/m
end