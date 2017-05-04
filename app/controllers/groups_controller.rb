class GroupsController < ApplicationController
  def create
    @group = Group.new(group_params)
    @group.creator_id = current_user.id
    if @group.save && user_signed_in?
      flash[:notice] = 'Group successfully saved!'
      redirect_to(@group)
    end
  end

  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
    @user = User.find(current_user.id)
  end

  def destroy
      Group.find(params[:id]).destroy
      flash[:success] = "User deleted"
      redirect_to (@user), notice: "User Account Deleted"
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
