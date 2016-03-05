=begin
  TODO
  add redircts for success
=end

class GroupsController < ApplicationController
  load_and_authorize_resource :group

  def new_user
    @user = User.new
  end

  def index
    @groups = current_user.groups
  end

  def new
  end

  def create
    @group = current_user.groups.create(group_params)
    if @group.valid?
      flash[:success] = 'Group created successfully'
      redirect_to :groups
    else
      flash[:danger] = 'Group failed to create'
      render(:new)
    end
  end

  def show
  end

  def add_user
    @group.users << User.find(params[:user_id])
    redirect_to @group
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
private
  def group_params
    params.require(:group).permit(:name)
  end
end
