class User < ActiveRecord::Base
    has_and_belongs_to_many :groups
    self.primary_key = "id"
    
    def self.all_students
        User.where(:status => ["Student", "Alumni"])
    end
   
   def authenticate(pass)
       @user = User.find_by(self.id)
       if(@user.password == pass)
           return true
       else
           return false
       end
   end
end