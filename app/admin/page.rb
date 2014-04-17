ActiveAdmin.register Page do
  
  form do |f|
    f.inputs do
      f.input :index, as: :wysihtml5, commands: :basic, blocks: :basic
      f.input :contact_us, as: :wysihtml5, commands: :basic, blocks: :basic
      f.input :about, as: :wysihtml5, commands: :basic, blocks: :basic
    end
    f.actions
  end

  permit_params :index, :contact_us, :about
  
end
