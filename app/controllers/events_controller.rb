class EventsController < ApplicationController

  def index
    @user = current_user
    @evevt = Event.new
    @events = @user.events
  end

  def show
    today = Date.today
    @user = current_user
    @event = Event.where(today - start_time).min
    @genre = Genre.find(params[:id])
    @genres = Genre.all
    @item = @event.item
    @items = @event.item
  end

  def new
    @event = Event.new
    @evenrs = Event.all
  end

  def create
    @event = Event.new(event_params)
    if @event.save
       redirect_to users_my_page_path(current_user)
    else
       render :new
    end
  end

  def destroy
    @today = Date.today
    @event = Event.find(params[:id])
    @event.destroy
    @events.each do |event|
      if event.start_time < @today
         event_destroy
      end
    end
    redirect_to users_my_page_path(current_user)
  end



  private

  def event_params
    params.require(:event).permit(:title, :start_time, :item_id).merge(user_id: current_user.id)
  end

end
