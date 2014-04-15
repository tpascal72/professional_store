class FrontpageController < ApplicationController
  def index
  end

  def search_results #Displays search results
  	@professionals = Professional.keyword_search(params[:search_keywords])
  end

  # "Create" a login, aka "log the user in"
  def corporate_log_in

    if user = Corporation.authenticate(params[:username])
      # Save the user ID in the session so it can be used in
      # subsequent requests
      session[:current_user_id] = user.name
      redirect_to root_url
    end
  end
end
