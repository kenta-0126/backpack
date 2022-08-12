class Event < ApplicationRecord

  has_many :genres
  belongs_to :users, optional: true

end
