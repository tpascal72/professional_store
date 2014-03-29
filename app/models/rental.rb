class Rental < ActiveRecord::Base
	belongs_to :professional
	belongs_to :order

	validates :amount, :start_date, :end_date, presence: true
	validates :amount, numericality: true, format: { with: /\A\d+\.?\d{0,2}\z/}
end
