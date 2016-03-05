=begin
  TODO
  add redircts for success
=end

class GroupsController < ApplcationController
  @@url = "localhost:3000"

  def new_user
    @user = User.new
    if user.valid
      flash[:success] = 'User created successfully'
      redirect_to :payments
  end

  def create
    @group = current_user.groups.create(name: params[:group][:name])
    if @group.valid?
      flash[:success] = 'Group created successfully'
      group_generate = URI::HTTP.build(:host => url, :path => '#{params[:group][:group_id]}')
      redirect_to group_generate
    else
      flash[:danger] = 'Group failed to create'
      render(:new)
    end
  end

  def add_user
    @group.users << User.find(params[:user_id])
  end

  def remove_user
    @user = User.find(params[:user_id])
    @group = user.groups.find(params[:group_id])
    if group
      user.groups.delete(group)
    else
      flash[:danger] = 'Could not remove user from group'
      render(:new)
    end
  end
end
