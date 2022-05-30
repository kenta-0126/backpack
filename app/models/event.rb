class Event < ApplicationRecord
  
  def index
  end
  
  def new
  end
  
  def create
  end
  
  private
  
  def event_params
    params.require(:event).parmit(:title, :start_time, :user_id)
  end
end
