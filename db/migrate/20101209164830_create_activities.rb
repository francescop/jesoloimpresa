class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.string :name
      t.string :address
      t.string :metatag
      t.text :description
      t.text :complete_description
      t.string :img1
      t.string :img2
      t.string :img3
      t.string :img4
      t.string :img5
      t.string :img6
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
