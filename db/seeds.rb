# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
    {:first_name => 'Michael', :last_name => 'Verdicchio', :email => 'mverdicc@citadel.edu',
    :password => 'password1234', :status => 'Admin', :graduation_date => '3-May-2000' } ,
    ]
    
users.each do |user|
   User.create!(user) 
end

groups = [
    {:title => "Cybersecurity", :description => "Cool hacker club"},
    ]
    
groups.each do |group|
    Group.create!(group)
end
