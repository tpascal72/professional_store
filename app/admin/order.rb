ActiveAdmin.register Order do
  

  permit_params :status, :pst_rate, :gst_rate, :hst_rate, :corporation_id
  
end
