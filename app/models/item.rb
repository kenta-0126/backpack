class Item < ApplicationRecord
  validates :genre_id, presence: true
  validates :name, presence: true
  
  belongs_to :genre
  belongs_to :user, optional: true
  has_many :event

  
end
