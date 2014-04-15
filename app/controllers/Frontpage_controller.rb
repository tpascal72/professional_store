class FrontpageController < ApplicationController
  def index
  end

  def search_results #Displays search results
  	@professionals = Professional.all
  end
end
