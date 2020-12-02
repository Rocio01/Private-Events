class User < ApplicationRecord
    validates :user_name, presence: true
end
