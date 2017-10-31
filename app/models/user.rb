class User < ActiveRecord::Base
    def self.all_students
        User.where(:status => ["Student", "Alumni"])
    end
    
end