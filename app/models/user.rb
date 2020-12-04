class User < ApplicationRecord
    validates :user_name, presence: true, uniqueness: true     
    has_many :events, foreign_key: 'creator_id', class_name: 'Event', dependent: :destroy
    has_many :enrollments, foreign_key: 'attendee_id'
    has_many :attended_events, through: :enrollments, source: :event
end
