class Category < ActiveRecord::Base
	has_many :professionals

	validates :name, presence: true
end
