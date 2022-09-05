class Genre < ApplicationRecord

  has_many :items
  belongs_to :event, optional: true
  belongs_to :user, optional: true
end
