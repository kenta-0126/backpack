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
    @today = DateTime.now
    @item = Item.find(params[:id])
    @user = current_user
    @events = @user.events
    @events.each do |event|
      if event.start_time >= @today
        @event = Event.find_by(start_time: Event.minimum(:start_time))
      end
    end
    @item.update(event_id: @event.id)


    if @event.start_time.strftime('%Y-%m-%d') < @today.strftime('%Y-%m-%d')
      Item.update_all(event_id: 0)
    end

    redirect_to users_my_page_path(@user)
  end

  def destroy
    @today = DateTime.now.to_time
    @user = current_user
    @events = @user.events
    @events.each do |event|
      if event.start_time.strftime('%Y-%m-%d') < @today.strftime('%Y-%m-%d')
        @event = Event.find_by(start_time: Event.minimum(:start_time))
      end
    end
    @items =@user.items
    @items.delete_all.where(event_id: @event.id)
  end

  private

  def item_params
    params.require(:item).permit(:name, :genre_id, :event_id, :user_id)
  end

end
