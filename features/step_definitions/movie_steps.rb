# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create(movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  debugger
  #page.body =~ /e1.*e2/
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  flunk "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(/, /).each do |rt|
    step(%Q(I #{uncheck}check "ratings_#{rt}"))
  end
end

Then /I should see all of the ([^ ]+)/ do |items|
  items.classify.constantize.all.each do |m|
    step(%Q(I should see "#{m[:title]}"))
  end
end

Then /I should see none of the ([^ ]+)/ do |items|
  items.classify.constantize.all.each do |m|
    step(%Q(I should not see "#{m[:title]}"))
  end
end
