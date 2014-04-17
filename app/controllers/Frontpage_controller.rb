class FrontpageController < ApplicationController
  def index
  	@page_content = Page.first
  end

  def contact
  	@page_content = Page.first
  end

  def about
  	@page_content = Page.first
  end

  def search_results #Displays search results
  	if params[:search_keywords] == ""
      @professionals = Array.new
    else
    	if params[:commit] == 'Available'
      	  @professionals = Professional.where(available: true).keyword_search(params[:search_keywords], params[:cat_id])
      	elsif params[:commit] == 'Recently Updated'
      	  @professionals = Professional.keyword_search(params[:search_keywords], params[:cat_id]).order('updated_at DESC')
      	else
      	  @professionals = Professional.keyword_search(params[:search_keywords], params[:cat_id])
      	end
    end
  end

  def cart
  	if !session[:professional].nil? && !session[:current_user_id].nil?
  	  @professionals = Professional.find(session[:professional])
  	  @corporation = Corporation.find(session[:current_user_id])
  	end
  end

  def make_order
  	@professionals = Professional.find(session[:professional])
  	@corporation = Corporation.find(session[:current_user_id])
  end

  def add_rental
  	# large validation ensures that all params must be present and 
  	if !session[:professional].nil?
	  if !params[:professional_num].nil? && !params[:hours].nil? && !params[:days].nil? && !params[:start_days].nil? && !(session[:professional].include? params[:professional_num].to_i)
	  	(session[:professional] ||= []) << params[:professional_num].to_i
	  	(session[:hours] ||= []) << params[:hours]
	  	(session[:days] ||= []) << params[:days]
	  	(session[:start_days] ||= []) << params[:start_days]
	  end
	else
	  if !params[:professional_num].nil? && !params[:hours].nil? && !params[:days].nil? && !params[:start_days].nil?
	  	(session[:professional] ||= []) << params[:professional_num].to_i
	  	(session[:hours] ||= []) << params[:hours]
	  	(session[:days] ||= []) << params[:days]
	  	(session[:start_days] ||= []) << params[:start_days]
	  end
	end
  end

  # "Create" a login, aka "log the user in"
  def corporate_log_in

  	if !params[:username].nil? && !params[:password].nil?

      if user = Corporation.authenticate(params[:username], params[:password])
        # Save the user ID in the session so it can be used in
        # subsequent requests
        session[:current_user_id] = user.id
        session[:current_user_name] = user.name
        redirect_to root_url
      else
      	flash[:login_notice] = "Username/password incorrect."
      end
    end
    if !params[:logout].nil?
      session[:current_user_id] = nil
      session[:professional] = nil
      session[:hours] = nil
      session[:days] = nil
      session[:start_days] = nil
    end
  end
end
