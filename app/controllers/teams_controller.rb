class TeamsController < ApplicationController
  before_action :require_user

    def index
      @teams = Team.where(user_id: current_user.id).all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def edit
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.new(team_params)
    @team.user_id = current_user.id

    if @team.save
      redirect_to teams_path
    else
      render 'new'
    end
  end

  def update
    @team = Team.find(params[:id])

    if @team.update(team_params)
      redirect_to @team
    else
      render 'edit'
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    redirect_to teams_path
  end

  private
  def team_params
    params.require(:team).permit(:first_name, :last_name, :user_id)
    end
end
