class ChoresController < ApplicationController
  def create
    @chore = Chore.new(chore_params)
    # @group = User.find(params[:group_id])
    # @chore.group = @group
    if @chore.save! && user_signed_in?
      flash[:notice] = 'Chore successfully created!'
    else
      flash[:alert] = "Chore not saved!"
    end
    redirect_to(current_user)
  end

  def new
    @chore = Chore.new
  end

  def destroy
    Chore.find(params[:id]).destroy
    flash[:success] = "Chore completed"
    redirect_to current_user, notice: "Chore completed"
  end

  def show
    @chore = Chore.find(params[:id])
  end

  private

  def chore_params
    params.require(:chore).permit(:task, :deadline)
  end
end
