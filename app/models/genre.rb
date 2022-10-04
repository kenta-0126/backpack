class Genre < ApplicationRecord
  
  validates :name, presence: true
  
  
  has_many :items
  belongs_to :event, optional: true
  belongs_to :user, optional: true
end
