class Event < ApplicationRecord
  has_many :genres
  belongs_to :item, optional: true
  belongs_to :user
end
