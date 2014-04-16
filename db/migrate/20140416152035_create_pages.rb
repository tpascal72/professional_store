class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.text :index
      t.text :contact_us

      t.timestamps
    end
  end
end
