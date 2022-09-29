class Item < ApplicationRecord
  belongs_to :genre
  belongs_to :user, optional: true
  has_many :event
  
  validates :genre_id, presence: true
  
  
end
