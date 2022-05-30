class ItemsController < ApplicationController

  def new

  end

  def create

  end

  def index

  end

  def show

  end

  def edit

  end

  
  private
  
  def item_params
    params.require(:item).permit(:name,:genre_id,:event_id)
  end
end
