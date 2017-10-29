class GroupsController < ApplicationController
    def group_params
    params.require(:group).permit(:title, :description)
  end
  
  def index
      @groups=Group.all
  end
    
    def new
        # default: render 'new' template
    end
    
    def show
        id = params[:id] # retrieve group ID from URI route
        @group = Group.find(id) # look up group by unique ID
    # will render app/views/groups/show.<extension> by default
    end

def edit
    @group = Group.find params[:id]
end

end