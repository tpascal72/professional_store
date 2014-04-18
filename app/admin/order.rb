ActiveAdmin.register Order do
  

  permit_params :status, :pst_rate, :gst_rate, :hst_rate, :corporation_id

  form html: { multipart: true } do |f|
    f.inputs "Details" do
      f.input :status, as: :select, collection: ['New', 'Unpaid', 'Paid']
      f.input :pst_rate
      f.input :gst_rate
      f.input :hst_rate
    end
    f.actions
  end
  
end
