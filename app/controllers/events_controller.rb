class EventsController < ApplicationController

  def index
    @user = current_user
    @evevt = Event.new
    @events = @user.events
  end

  def show
    @today = DateTime.today
    @user = current_user
    @genre = Genre.find(params[:id])
    @genres = Genre.all
    @evenrs = Event.all
    @events.each do |event|
      if event.start_time < @today
        @event = Event.find_by(start_time: Event.minimum(:start_time))
      end
    end
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
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to users_my_page_path(current_user)
  end



  private

  def event_params
    params.require(:event).permit(:title, :start_time, :item_id).merge(user_id: current_user.id)
  end

end
