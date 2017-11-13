class UsersController < ApplicationController
  def index
    @all_users=User.all
    @all_groups=Group.all
    
    @selected_users = Array.new
    
    #This gives us the ids  
    @selected_groups = params[:groups] || session[:groups] || {}
    
    
    if @selected_groups == {}
      @selected_groups = Hash[@all_groups.map {|group| [group.title, group.id]}]
    end
    
      
    @selected_groups.values.each do |group_id|
      Group.find(group_id).users.each do |user|
        #maintain uniqueness
        if !@selected_users.include? user
          @selected_users.push(user)
        end
      end
    end
    
    if params[:groups] != session[:groups]
      session[:groups] = @selected_groups
      flash.keep
      redirect_to :groups => @selected_groups and return
    end
      
      
  end
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :graduation_date, :status, :group_ids => [])
  end
  
  def new
    @all_groups=Group.all
  end
  
  def edit
    @user = User.find params[:id]
  end
  
  def show
    @user = User.find params[:id]
    @groups=Group.all
  end
  
  def create
    @selected_groups = params[:groups]
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
