class CreateAnnouncements < ActiveRecord::Migration
  def self.up
    create_table :announcements do |t|
      t.integer :announcementcategory_id
      t.string :comune
      t.string :indirizzo
      t.string :titolo
      t.string :offrocerco
      t.text :descrizione
      t.string :email
      t.string :nome
      t.string :telefono
      t.string :sitoweb
      t.boolean :attivo
      t.string :permalink
      t.string :image1_file_name
      t.string :image1_content_type
      t.integer :image1_file_size
      t.datetime :image1_updated_at
      t.string :image2_file_name
      t.string :image2_content_type
      t.integer :image2_file_size
      t.datetime :image2_updated_at
      t.string :image3_file_name
      t.string :image3_content_type
      t.integer :image3_file_size
      t.datetime :image3_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :announcements
  end
end
