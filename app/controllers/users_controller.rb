class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    if user_signed_in?
      @user = User.find(current_user.id)
    else
      root_path
    end
  end
end
