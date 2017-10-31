class StudentsController < ApplicationController
    def student_params
         params.require(:student).permit(:first_name, :middle_initial, :last_name, :email, :graduation_date, :status)
    end
  
    def new
    end
    
    def index
        @students = Student.all
    end
    
    def create
        @student = Student.create!(student_params)
        flash[:notice] = "#{@student.first_name} #{@student.last_name} was successfully created."
        redirect_to students_path
    end
end

