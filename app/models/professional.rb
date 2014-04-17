class Professional < ActiveRecord::Base
  has_attached_file :image, styles: { thumb: "80x80#" }, whiny_thumbnails: false
  has_many :rentals
  belongs_to :category

  validates :fname, :lname, :cost_per_hour, :skills, presence: true
  validates :cost_per_hour, numericality: true, format: { with: /\A\d+\.?\d{0,2}\z/}

  def self.keyword_search(keywords, cat_id) #Displays search results
  	
    if cat_id == nil || cat_id == ""
      keywords = "%" + keywords + "%"
      @professionals = Professional.where("skills LIKE ?", keywords)
    else
      keywords = "%" + keywords + "%"
      cat_id = "%" + cat_id + "%"
      @professionals = Professional.where("skills LIKE ? AND category_id LIKE ?", keywords, cat_id)
    end
  end
end
