class Corporation < ActiveRecord::Base

	belongs_to :province
	has_many :orders

	validates :name, :address, presence: true
end
