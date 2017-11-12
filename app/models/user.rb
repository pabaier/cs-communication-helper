class User < ActiveRecord::Base
    has_and_belongs_to_many :groups
    self.primary_key = "id"
    
    def self.all_students
        User.where(:status => ["Student", "Alumni"])
    end
    
end