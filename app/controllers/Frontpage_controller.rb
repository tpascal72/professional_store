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
  	if params[:search_keywords].nil?
      @professionals = Array.new
    elsif params[:search_keywords] == ""
      @professionals = Array.new
    else
      @professionals = Professional.keyword_search(params[:search_keywords], params[:cat_id]).page(params[:page]).per(5)
    end
    
    if params[:commit] == 'Recently Updated'
      @professionals = Professional.keyword_search(params[:search_keyword], params[:cat_id]).order('updated_at DESC').page(params[:page]).per(5)
    end
    if params[:commit] == 'Available'
      @professionals = Professional.where(available: true).keyword_search(params[:search_keywords], params[:cat_id]).page(params[:page]).per(5)
    end
  end

  def cart
  	if !session[:professional].nil? && !session[:current_user_id].nil?
  	  @professionals = Professional.find(session[:professional])
  	  @corporation = Corporation.find(session[:current_user_id])
  	end
  end

  def make_order
  	if params[:commit] == 'Make Order'
  		@professionals = Professional.find(session[:professional])
  		@corporation = Corporation.find(session[:current_user_id])

  		order = @corporation.orders.build

  		order.status = 'New'
  		order.pst_rate = @corporation.province.pst.round(5)
			order.gst_rate = @corporation.province.gst.round(5)
			order.hst_rate = @corporation.province.hst.round(5)

			order.save

			grand_total = 0

  		@professionals.each do |professional|
  			related_index = session[:professional].index(professional.id).to_i
  			start_date = session[:start_days][related_index].to_i.days.from_now.to_date
	      end_date = start_date + session[:days][related_index].to_i

	      subtotal = (professional.cost_per_hour.to_f.round(2) * session[:hours][related_index].to_i * session[:days][related_index].to_i)
        subtotal = subtotal.to_f.round(2)
        taxes = (subtotal * (@corporation.province.pst.round(5) + @corporation.province.gst.round(5) + @corporation.province.hst.round(5))).round(2)

  			rental = order.rentals.build

  			rental.amount = subtotal
  			rental.start_date = start_date
  			rental.end_date = end_date
  			rental.professional_id = professional.id

  			professional.available = false
  			professional.save
	  		
	  		rental.save

	  		grand_total += (subtotal + taxes)
    	end

    	@amount = grand_total

    	session[:professional] = nil
      session[:hours] = nil
      session[:days] = nil
      session[:start_days] = nil
	 	end
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
      flash[:login_notice] = "You have been logged out."
    end
  end


end
