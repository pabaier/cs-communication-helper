class UsersController < ApplicationController
  def index
      @users=User.all
      @all_groups = Group.all_groups
  end
end