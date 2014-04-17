class AddAboutToPage < ActiveRecord::Migration
  def change
    add_column :pages, :about, :text
  end
end
