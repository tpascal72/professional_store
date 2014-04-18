class ChangeDatatypeForProvinces < ActiveRecord::Migration
  def self.up
    change_table :provinces do |t|
      t.change :pst, :bigdecimal
      t.change :gst, :bigdecimal
      t.change :hst, :bigdecimal
    end
  end
  def self.down
    change_table :provinces do |t|
      t.change :pst, :decimal
      t.change :gst, :decimal
      t.change :hst, :decimal
    end
  end
end
