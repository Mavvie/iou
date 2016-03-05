=begin
  TODO
  add redircts for success
=end

class GroupsControl < ApplcationControl
  def new_user
    @@user = User.new
  end	

  def create
    @group = current_user.groups.create(name: params[:group][:name])
    if @group.valid?
      flash[:success] = 'Group created successfully'
      # redirect_to 
    else
      flash[:danger] = 'Group failed to create'
      render(:new)
    end
  end

  def add_user
    @group.users << User.find(params[:user_id])
  end
end