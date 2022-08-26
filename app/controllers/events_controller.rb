class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @genre = Genre.find(params[id])
    @genres = Genre.all
    @item = @genre.item
    @items = @genre.items
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

  private

  def event_params
    params.require(:event).permit(:title, :start_time).merge(user_id: current_user.id)
  end

end
