require 'rails_helper'
describe User do
    describe "all_students" do
        it "should find all students" do
            student1 = User.create! :status => "Student"
            student2 = User.create! :status => "Alumni"
            
            expect(User.all_students).to include(student1)
            expect(User.all_students).to include(student2)
        end
        it "should not find admins" do
            student1 = User.create! :status => "Student"
            student2 = User.create! :status => "Admin"
            
            expect(User.all_students).not_to include(student2)
        end
    end
end