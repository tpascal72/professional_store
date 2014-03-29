ActiveAdmin.register Rental do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :amount, :start_date, :end_date, :professional_id, :order_id
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
  form do |f|
    f.inputs "Details" do
      f.input :amount
      f.input :start_date
      f.input :end_date
    end
    f.inputs "References" do
      f.input :professional_id, as: :select, collection: Professional.all.map{ |p| [p.fname + " " + p.lname, p.id] }
      f.input :order_id, as: :select, collection: Order.all.map{ |o| [o.id, o.id] }
    end
    f.actions
  end

end
