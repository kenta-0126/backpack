class ItemsController < ApplicationController

  def new
    @item = Item.new
    @items = Item.all
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to new_item_path
  end

  def index
    @item = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
    @items = Item.
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
  end

  
  private
  
  def item_params
    params.require(:item).permit(:name,:genre_id,:event_id)
  end
end
