class ItemsController < ApplicationController

  def new
    @user = current_user
    @item = Item.new
    @items = @user.item
    @genres = @user.genres
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.save
    redirect_to new_item_path
  end

  def index
    @item = Item.all
  end

  def show
    @item = Item.find(params[:id])

  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(:event_id)
  end


  private

  def item_params
    params.require(:item).permit(:name,:genre_id,:event_id, :user_id)
  end

end
