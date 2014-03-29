class AddOrderRefToRentals < ActiveRecord::Migration
  def change
    add_reference :rentals, :order, index: true
  end
end
