class CreateProfessionals < ActiveRecord::Migration
  def change
    create_table :professionals do |t|
      t.string :fname
      t.string :lname
      t.decimal :cost_per_hour
      t.boolean :available
      t.string :skills

      t.timestamps
    end
  end
end
