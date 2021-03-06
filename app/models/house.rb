class House < ApplicationRecord
    has_many :users
    has_many :payments
    has_many :questions
    has_many :payments
 	has_many :repays
    has_many :dices
    has_many :schedules
    has_many :intervals
    validates :name, presence: true, length: { maximum: 255 },
                    uniqueness: { case_sensitive: true }	
    validates :code,  presence: true, length: { maximum: 50 }
end
