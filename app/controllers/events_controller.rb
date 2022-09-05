class EventsController < ApplicationController

  def index
    @user = current_user
    @events = @user.events
  end

  def show
    @user = current_user
    @event = Event.find(params[:id])
    @genre = Genre.find(params[:id])
    @genres = Genre.all
    @item = Item.find(params[:event_id])
    @items = Item.find(params[:event_id])
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

    def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to users_my_page_path(current_user)
    end

  end

  private

  def event_params
    params.require(:event).permit(:title, :start_time,:item_id).merge(user_id: current_user.id)
  end

end
