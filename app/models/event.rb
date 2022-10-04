class Event < ApplicationRecord

  validates :start_time, presence: true
  validates :title, presence: true

  validate :date_time_cannot

  def date_time_cannot
     unless start_time == nil
        errors.add(:start_time, '過去の日付を登録できません') if start_time <= DateTime.yesterday.to_time
     end
  end

  has_many :genres
  belongs_to :item, optional: true
  belongs_to :user, optional: true


end