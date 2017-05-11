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

  def destroy
    Chore.find(params[:id]).destroy
    flash[:success] = "Chore completed"
    redirect_to current_user, notice: "Chore completed"
  end

  def edit
    @chore = Chore.find(params[:id])
  end

  def new
    @chore = Chore.new
  end


  def show
    @chore = Chore.find(params[:id])
  end

  def update
    @chore = Chore.find(params[:id])
    @chore.update_attributes(status: status_params["chore"])
    redirect_to current_user
  end

  private

  def chore_params
    params.require(:chore).permit(:task, :assignment, :deadline, :group_id)
  end

  def status_params
    params.permit(:status)
  end
end
