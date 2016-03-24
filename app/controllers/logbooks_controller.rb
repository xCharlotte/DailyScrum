class LogbooksController < ApplicationController
 before_action :require_user
  
  def index
    @logbooks = Logbook.where(user_id: current_user.id).all
  end
  
  def show
    @logbook = Logbook.find(params[:id])
  end
  
  def new
    @logbook = Logbook.new
  end
  
  def edit
    @logbook = Logbook.find(params[:id])
  end
  
  def create
    @logbook = Logbook.new(logbook_params)
    @logbook.user_id = current_user.id
    
    if @logbook.save
      redirect_to @logbook
    else
      render 'new'
    end
  end
    
  def update
    @logbook = Logbook.find(params[:id])
    
    if @logbook.update(logbook_params)
      redirect_to @logbook
    else
      render 'edit'
    end
  end
  
  def destroy
    @logbook = Logbook.find(params[:id])
    @logbook.destroy
  
    redirect_to logbooks_path
  end
  
  private
    def logbook_params
      params.require(:logbook).permit(:title, :text)
    end
  end
