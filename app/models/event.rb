class Event < ApplicationRecord
  
  def start_time
    self.date
  end
  
end
