class Professional < ActiveRecord::Base
  has_attached_file :image
  has_many :rentals
  belongs_to :category

  validates :fname, :lname, :cost_per_hour, :available, :skills, presence: true
  validates :cost_per_hour, numericality: true, format: { with: /\A\d+\.?\d{0,2}\z/}

  def self.keyword_search(keywords) #Displays search results
  	keywords = "%" + keywords + "%"
  	@professionals = Professional.where("skills LIKE ? OR category_id LIKE ?", keywords, keywords)
  end
end
