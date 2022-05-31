class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  def index
    @item = Item.all
  end

  def edit
    @item = Item.find(item_params[:id])
  end

  def update
    @item = Item.find(item_params[:id])
    @item.update(item_params)
  end

  
  private
  
  def item_params
    params.require(:item).permit(:name,:genre_id,:event_id)
  end
end
