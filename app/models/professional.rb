class Professional < ActiveRecord::Base
	has_many :rentals
	belongs_to :category

	validates :fname, :lname, :cost_per_hour, :available, :skills, presence: true
	validates :cost_per_hour, numericality: true, format: { with: /\A\d+\.?\d{0,2}\z/}
end
