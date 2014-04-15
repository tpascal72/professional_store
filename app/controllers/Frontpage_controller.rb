class FrontpageController < ApplicationController
  def index
  end

  def search_results #Displays search results
  	@professionals = Professional.keyword_search(params[:search_keywords])
  end
end
