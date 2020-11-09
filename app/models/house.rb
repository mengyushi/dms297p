class House < ApplicationRecord
    has_many :users
	has_many :payments
	validates :name, presence: true, length: { maximum: 255 },
                    uniqueness: { case_sensitive: true }	
    validates :code,  presence: true, length: { maximum: 50 }
end
