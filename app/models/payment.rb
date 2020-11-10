class Payment < ApplicationRecord
    belongs_to :house
    belongs_to :user
    has_many :users
    has_one :question
end
