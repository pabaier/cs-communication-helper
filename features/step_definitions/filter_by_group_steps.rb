When /^(?:|I )check the following groups: "([^"]*)"$/ do |group_list|
    
end

Given /the following groups_users exist/ do |groups_users_table|
  groups_users_table.hashes.each do |gu|
    Group#users << gu

  end
end