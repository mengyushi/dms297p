class Message < ApplicationRecord
	belongs_to :user, -> { with_deleted }
	belongs_to :house
end
