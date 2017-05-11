class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if user_signed_in?
      @users = User.all
      @user = User.find(params[:id])
      @groups = Group.all
      @chores = Chore.all
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
