class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances, source: :attendee, dependent: :delete_all

  scope :upcoming_events, -> { where('date >= ?', Date.current) }
  scope :past_events, -> { where('date < ?', Date.current) }

  validates_presence_of :title
  validates_presence_of :location
  validates_presence_of :description
  validates_presence_of :date
end
