class UsersController < ApplicationController
  def index
      @users=User.all
      @all_groups = Group.all
  end
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :graduation_date, :status)
  end
  
  def new
  end
  
  def create
    @user = User.create!(user_params)
    flash[:notice] = "#{@user.first_name} #{@user.last_name} was successfully created."
    redirect_to users_path
  end
end
