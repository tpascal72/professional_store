class Professional < ActiveRecord::Base
	has_attached_file :image
	has_many :rentals
	belongs_to :category

	validates :fname, :lname, :cost_per_hour, :available, :skills, presence: true
	validates :cost_per_hour, numericality: true, format: { with: /\A\d+\.?\d{0,2}\z/}

end
