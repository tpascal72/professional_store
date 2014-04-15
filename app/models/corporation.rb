class Corporation < ActiveRecord::Base

  belongs_to :province
  has_many :orders

  validates :name, :address, :password, presence: true
  validates :password, length: { minimum: 6 }

  def self.authenticate(name, password)
    user = find_by_name(name)
    if user && user.password == password
      user
    else
      nil
    end
  end
end
