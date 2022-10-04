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
    @today = DateTime.now.to_time
    @item = Item.find(params[:id])
    @user = current_user
    @events = @user.events
    @events.each do |event|
      if event.start_time.strftime('%Y-%m-%d') >= @today.strftime('%Y-%m-%d')
        @event = Event.find_by(start_time: Event.minimum(:start_time))
      end
    end

    @item.update(event_id: @event.id)

    if { check_box: @item.check_box? == true }
      @item.update(check_box: true)
    else
      @item.update(check_box: false)
    end

    if @event.start_time.strftime('%Y-%m-%d') < @today.strftime('%Y-%m-%d')
      Item.update_all(event_id: 0, check_box: false)
    end

    redirect_to users_my_page_path(@user)
  end

  private

  def item_params
    params.require(:item).permit(:name, :genre_id, :event_id, :user_id, check_box: [])
  end
end
