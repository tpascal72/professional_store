class Province < ActiveRecord::Base
	validates :name, :pst, :gst, :hst, presence: true
	validates :pst, :gst, :hst, numericality: true
	validates :pst, :gst, :hst, format: { with: /\A\d+\.?\d{0,2}\z/}
end
