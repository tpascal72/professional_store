class Corporation < ActiveRecord::Base
	validates :name, :address, presence: true
end
