class CreateUsersAndGroups < ActiveRecord::Migration
    def change
        create_table :users, id: false, primary_key: :email do |t|
            t.string :first_name
            t.string :last_name
            t.string :email
            t.string :password
            t.string :status
            t.date :graduation_date
        end
        
        create_table :groups do |t|
            t.string :title
            t.text :description
        end
        
        create_table :users_groups, id: false do |t|
            t.belongs_to :user, index: true
            t.belongs_to :group, index: true
        end
    end
end