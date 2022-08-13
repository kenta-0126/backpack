class Genre < ApplicationRecord

  has_many :items
  belongs_to :event
  belongs_to :user
end
