When /^(?:|I )check the following groups: ([^"]*)$/ do |group_list|
  group_list.split.each do |group|
    group_id = Group.find_by_title(group).id
    check("groups[#{group}]")
    # find("groups[#{group}]").click
    # find("groups_#{group_id}").click

  end
end


Given /the following groups_users exist/ do |groups_users_table|
  groups_users_table.hashes.each do |gu|
    # https://apidock.com/rails/ActiveRecord/Associations/ClassMethods/has_and_belongs_to_many
    Group#users << gu

  end
end