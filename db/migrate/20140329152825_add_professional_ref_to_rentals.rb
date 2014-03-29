class AddProfessionalRefToRentals < ActiveRecord::Migration
  def change
    add_reference :rentals, :professional, index: true
  end
end
