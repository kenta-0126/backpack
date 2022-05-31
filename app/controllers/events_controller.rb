class EventsController < ApplicationController
  
  def index
    @event = Event.all
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to users_my_page_path(current_user) 
  end
  
  private
  
  def event_params
    params.require(:event).parmit(:title, :start_time, :user_id)
  end
  
end
