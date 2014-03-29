class AddCategoryRefToProfessionals < ActiveRecord::Migration
  def change
    add_reference :professionals, :category, index: true
  end
end
