class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if user_signed_in?
      @user = User.find(current_user.id)
      @groups = Group.find(current_user.created_group_ids)
    else
      root_path
    end
  end

  def destroy
    if user_signed_in
      User.find(params[:id]).destroy
      flash[:success] = "User deleted"
      redirect_to users_path, notice: "User Account Deleted"
    else
      redirect_to root_path
    end
  end
end
