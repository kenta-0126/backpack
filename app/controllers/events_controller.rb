class EventsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @user = current_user
    @evet = Event.new
    @events = @user.events
  end

  

  def new
    @event = Event.new
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to users_my_page_path(current_user)
  end

  def update; end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to users_my_page_path(current_user)
  end

  private

  def event_params
    params.require(:event).permit(:title, :start_time, :item_id).merge(user_id: current_user.id)
  end
end
