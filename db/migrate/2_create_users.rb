class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :first_name
      t.string :middle_initial
      t.string :last_name
      t.string :email
      t.string :password
      t.string :status
      t.datetime :graduation_date
    end
  end

  def down
    drop_table :users
  end
end
