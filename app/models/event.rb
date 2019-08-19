class Event < ApplicationRecord
	has_many :attendances 
	has_many :users , through: :attendances 
    belongs_to :admin, class_name: "User"


	validates :start_date, presence: true 
	validates :duration, presence: true, numericality: {:greater_than_or_equal_to => 0}
	validates :title, presence: true, length: { in: 5..140 }
	validates :description, presence: true, length: { in: 20..1000}
	validates :price, presence: true, length: { in: 1..1000}
	validates :location, presence: true

#start_date must be in the future

	validate :start_date_cannot_be_in_the_past
    def start_date_cannot_be_in_the_past
        if start_date < Date.today
            errors.add(:start_date, "can't be in the past")
        end
    end

#duration must be multiple of 5

    validate :duration_is_multiple_by_five
    def duration_is_multiple_by_five
        if (duration.to_i%5  != 0)
            errors.add(:duration, "put value multiple by 5")
        end
    end
end
