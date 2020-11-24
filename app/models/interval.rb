class Interval < ApplicationRecord
    belongs_to :user
    belongs_to :house
    belongs_to :schedule
end
