When /^(?:|I )check the following groups: ([^"]*)$/ do |group_list|
  group_list.split.each do |group|
    group_id = Group.find_by_title(group).id
    #check("groups[#{group}]")
    check("groups_#{group_id}", allow_label_click: true)
    # find("groups[#{group}]").click
    # find("groups_#{group_id}").click

  end
end

When /^(?:|I )uncheck the following groups: ([^"]*)$/ do |group_list|
  group_list.split.each do |group|
    group_id = Group.find_by_title(group).id
    uncheck("groups_#{group_id}", allow_label_click: true)
    # find("groups[#{group}]").click
    # find("#groups_#{group_id}").click
    # find("groups_#{group_id}", visible: false).set(true).click

  end
end

Given /the following groups_users exist/ do |groups_users_table|
  groups_users_table.hashes.each do |gu|
    # https://apidock.com/rails/ActiveRecord/Associations/ClassMethods/has_and_belongs_to_many
    Group#users << gu
  end
end

Then /^(?:|I )should see the following users: ([^"]*)$/ do |users_list|
  users_list.split(" ").each do |user|
    steps %Q{
      Then I should see "#{user}"
    }
  end
end

Then /^(?:|I )should not see the following users: ([^"]*)$/ do |users_list|
  users_list.split(" ").each do |user|
    steps %Q{
      Then I should not see "#{user}"
    }
  end
end
