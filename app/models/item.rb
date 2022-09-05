class Item < ApplicationRecord

  belongs_to :genre, optional: true
  belongs_to :user, optional: true
  has_many :event

end
