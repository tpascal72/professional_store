class AddCorporationRefToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :corporation, index: true
  end
end
