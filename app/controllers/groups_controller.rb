class GroupsController < ApplicationController
  def index
   @groups = Group.all
  end

  def create
    @group = Group.new(group_params)
    @group.creator_id = current_user.id
    if @group.save && user_signed_in?
      flash[:notice] = 'Group successfully saved!'
      redirect_to(@group)
    end
  end

  def edit
    @group = Group.find(params[:id])
    @users = User.all
  end

  def update
    @group = Group.find(params[:id])
    @user = User.find_by(username: username_params["user"])
    if !@group.users.include?(@user)
      @group.users << @user
    end
    redirect_to @group
  end

  def new
    @group = Group.new
  end

  def show
    @users = User.all
    @group = Group.find(params[:id])
    @membership = @group.users
    @chores = Chore.all
  end

  def destroy
    Group.find(params[:id]).destroy
    flash[:success] = "Group deleted"
    redirect_to current_user, notice: "Group Account Deleted"
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def username_params
    params.permit(:user)
  end
end
