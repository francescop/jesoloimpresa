class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.string :title
      t.string :subtitle
      t.string :big_image
      t.string :big_image_alt
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :news
  end
end
