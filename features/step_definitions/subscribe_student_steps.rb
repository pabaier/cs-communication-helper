When("I subscribe to {string}") do |group|
    group_id = Group.find_by_title(group).id
    steps %Q{
          Given I am on the student details page
          When I check "user_group_ids_#{group_id}"
          And I press "Update User"
    }
end

When("I unsubscribe from {string}") do |group|
    group_id = Group.find_by_title(group).id
    steps %Q{
          Given I am on the student details page
          When I uncheck "user_group_ids_#{group_id}"
          And I press "Update User"
    }
end