class AddPasswordToCorporation < ActiveRecord::Migration
  def change
    add_column :corporations, :password, :string
  end
end
