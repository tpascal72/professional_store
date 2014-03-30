class AddProvinceRefToCorporations < ActiveRecord::Migration
  def change
    add_reference :corporations, :province, index: true
  end
end
