class UsersController < ApplicationController
  require 'csv'

  def index
    @all_users=User.all
    @all_groups=Group.all
    @all_delimiters = [",", ";"]
    
    @selected_users = Array.new
    @selected_emails = Array.new
  
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
          @selected_emails.push(user.email)
        end
      end
    end
    
    if params[:groups] != session[:groups]
      session[:groups] = @selected_groups
      session[:emails] = @selected_emails
      flash.keep
      redirect_to :groups => @selected_groups and return
    end
    
  end
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :graduation_date, :status, :group_ids => [])
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

    @cs_group = Group.where(title: 'Computer Science').first
    @cs_group_id = Group.find_by_title('Computer Science').id
    
    @selected_groups = params[:groups] || {}
    
    if @selected_groups == {}
      @selected_groups = {@cs_group.title => @cs_group_id}
    end
    
    if !@selected_groups.has_key?('Computer Science')
      @selected_groups.merge({@cs_group.title => @cs_group_id})
    end

    @user = User.create!(user_params)
    
    @selected_groups.values.each do |group_id|
      group = Group.find_by_id(group_id)
      @user.groups << group
    end
    
    flash[:notice] = "#{@user.first_name} #{@user.last_name} was successfully created."
    redirect_to users_path
  end

  def update
    @user = User.find params[:id]
    @user.update_attributes!(user_params)
    flash[:notice] = "#{@user.first_name} was successfully updated."
    redirect_to user_path(@user)
  end
  
  def import
    # User.import(params[:file])
    # puts params[:file]
    if params.key?(:file) then
      errors = User.import(params[:file])
      if errors.length >= 1 then
        flash[:notice] = "Unable to import #{errors.length} users:#{errors}"
      else
        flash[:notice] = "Data imported successfully"
      end
    else
      flash[:notice] = "No file selected!"
    end
    redirect_to users_path
      # redirect_to users_path, notice: "Data imported successfully"
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
  
  def export
    @emails = session[:emails] || []
    @delimiter = params[:delimiter]
  end
end
