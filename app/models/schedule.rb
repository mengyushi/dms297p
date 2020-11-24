class Schedule < ApplicationRecord
    belongs_to :user
    belongs_to :house
    has_many :intervals
end
