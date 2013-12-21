
Then(/^the current path should be ([^"]*)$/) do |path|
  case path
    when 'home' then current_path.should include('index.html')
  end
end

And(/^there should be a ([^"]*) folder$/) do |folder|
  visit "#{folder}/.keep"
end