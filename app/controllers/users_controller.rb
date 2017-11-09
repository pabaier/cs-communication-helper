class UsersController < ApplicationController
  def index
    @users=User.all
    @all_groups=Group.all
      
    @selected_groups = params[:groups] || session[:groups] || {}
      
      
    if @selected_groups == {}
      @selected_groups = Hash[@all_groups.map {|groups| [groups, groups]}]
    end
      
      
    puts @selected_groups 
      
    @selected_users
      
  end
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :graduation_date, :status, :group_ids => [])
  end
  
  def new
  end
  
  def edit
    @user = User.find params[:id]
  end
  
  def show
    @user = User.find params[:id]
    @groups=Group.all
  end
  
  def create
    @user = User.create!(user_params)
    flash[:notice] = "#{@user.first_name} #{@user.last_name} was successfully created."
    redirect_to users_path
  end

  def update
    @user = User.find params[:id]
    @user.update_attributes!(user_params)
    flash[:notice] = "#{@user.first_name} was successfully updated."
    redirect_to user_path(@user)
  end
  
  def destroy
    @user = User.find params[:id]
    if @user.status == 'Admin'
      flash[:notice] = "#{@user.last_name} cannot be removed."
    else
      flash[:notice] = "#{@user.last_name} was successfully removed."
      User.delete(@user.id)
    end
    redirect_to users_path

  end
end
