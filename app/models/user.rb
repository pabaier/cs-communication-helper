class User < ActiveRecord::Base
  require 'csv'
  has_and_belongs_to_many :groups
  self.primary_key = "id"
  
  def self.all_students
      User.where(:status => ["Student", "Alumni"])
  end

  # a class method import, with file passed through as an argument
  def self.import(file)
    fields = ["first_name", "last_name", "email", "password", "status", "graduation_date"]
    # a block that runs through a loop in our CSV data
    CSV.foreach(file.path, headers: false) do |row|
      x = Hash[fields.zip(row)] 
      # creates a user for each row in the CSV file
      User.create! x#row.to_hash 
    end 
  end 
    
end