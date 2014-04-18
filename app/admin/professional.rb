ActiveAdmin.register Professional do

  
  permit_params :fname, :lname, :cost_per_hour, :available, :skills, :image, :category_id, :remove_image


  form html: { multipart: true } do |f|
    f.inputs "Details" do
      f.input :category_id, as: :select, collection: Category.all.map{ |c| [c.name, c.id] }
      f.input :fname
      f.input :lname
      f.input :cost_per_hour
      f.input :available
      f.input :skills
    end
    f.inputs "Image" do
      if f.object.image_file_name.to_s != ''
        f.input :remove_image, as: :boolean, required: false, label: 'Remove professional image'
      else
        f.input :image, required: false
      end
    end
    f.actions
  end

end
