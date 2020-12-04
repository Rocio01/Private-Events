class User < ApplicationRecord
    validates :user_name, presence: true
    has_many :events, dependent: :destroy
    has_many :enrollments
    has_many :attended_events, through: :enrollments, source: :event
end
