class Order < ActiveRecord::Base
	has_many :rentals

	validates :status, :pst_rate, :gst_rate, :hst_rate, presence: true
	validates :pst_rate, :gst_rate, :hst_rate, numericality: true
	validates :pst_rate, :gst_rate, :hst_rate, format: { with: /\A\d+\.?\d{0,2}\z/}
end
