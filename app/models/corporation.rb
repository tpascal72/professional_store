class Corporation < ActiveRecord::Base

	belongs_to :province
	has_many :orders

	validates :name, :address, :password, presence: true
	validates :password, length: { minimum: 6 }

	def self.authenticate(name)
    user = find_by_name(name)
    if user # && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  	end
end
