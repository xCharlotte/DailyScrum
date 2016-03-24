class StandupsController < ApplicationController
  before_action :require_user, only: [:index, :show, :new, :edit, :create, :update, :destroy, :private]
  
  def index
    @standups = Standup.where(user_id: current_user.id).all
  end
  
  def show
    @standup = Standup.find(params[:id])
  end

  def new 
    @standup = Standup.new
    @team = Team.where(user_id: current_user.id).all
  end
  
  def edit
    @standup = Standup.find(params[:id])
    @team = Team.where(user_id: current_user.id).all
  end
  
  def create
    @standup = Standup.new(standup_params)
    @standup.user_id = current_user.id
    
    if @standup.save
      redirect_to @standup
    else
      render 'new'
    end
  end
  
  def update
    @standup = Standup.find(params[:id])
    
    if @standup.update(standup_params)
      redirect_to @standup
    else
      render 'edit'
    end
  end
  
  def destroy
    @standup = Standup.find(params[:id])
    @standup.destroy
    
    redirect_to standups_path
  end
  
  private
    def standup_params
      params.require(:standup).permit(:yesterday, :today, :problems, :team_id)
    end
end
