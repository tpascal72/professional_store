class AddAttachmentImageToProfessionals < ActiveRecord::Migration
  def self.up
    change_table :professionals do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :professionals, :image
  end
end
