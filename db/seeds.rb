# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
    {:first_name => 'John', :middle_initial => 'B', :last_name => 'Smith', :email => 'jbsmith123@citadel.edu',
    :password => 'password1234', :status => 'admin', :graduation_date => '3-May-2000' } ,
    {:first_name => 'Jane', :middle_initial => 'B',:last_name => 'Smith', :email => 'bsmith124@citadel.edu', 
    :password => 'password567', :status => 'student', :graduation_date => '3-May-2020'},
    ]
    
users.each do |user|
   User.create!(user) 
end