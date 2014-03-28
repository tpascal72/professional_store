class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.decimal :amount
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
