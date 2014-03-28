class Rental < ActiveRecord::Base
	validates :amount, :start_date, :end_date, presence: true
	validates :amount, numericality: true, format: { with: /\A\d+\.?\d{0,2}\z/}
end
