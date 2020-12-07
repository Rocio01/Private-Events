class Event < ApplicationRecord
  validates :title, :description, :event_date, presence: true
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :enrollments
  has_many :attendees, through: :enrollments, source: :user
  scope :past, -> { where('event_date < ?', Date.today) }
  scope :upcoming, -> { where('event_date >= ?', Date.today) }

end
