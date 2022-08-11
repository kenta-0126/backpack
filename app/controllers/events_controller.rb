class EventsController < ApplicationController
  
  def index
    @events = Event.all
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
    params.require(:event).permit(:title, :start_time, :user_id)
  end
  
end
