# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110327101500) do

  create_table "activities", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "metatag"
    t.text     "description"
    t.text     "complete_description"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "expiredate"
    t.string   "altimage1"
    t.string   "altimage2"
    t.string   "altimage3"
    t.string   "altimage4"
    t.string   "altimage5"
    t.string   "altimage6"
    t.string   "phone"
    t.string   "website"
    t.integer  "peso"
    t.boolean  "banner"
    t.string   "img1_file_name"
    t.string   "img1_content_type"
    t.string   "img2_file_name"
    t.string   "img2_content_type"
    t.string   "img3_file_name"
    t.string   "img3_content_type"
    t.string   "img4_file_name"
    t.string   "img4_content_type"
    t.string   "img5_file_name"
    t.string   "img5_content_type"
    t.string   "img6_file_name"
    t.string   "img6_image_content_type"
    t.string   "permalink"
  end

  create_table "admin_users", :force => true do |t|
    t.string   "first_name",       :default => "",    :null => false
    t.string   "last_name",        :default => "",    :null => false
    t.string   "role",                                :null => false
    t.string   "email",                               :null => false
    t.boolean  "status",           :default => false
    t.string   "token",                               :null => false
    t.string   "salt",                                :null => false
    t.string   "crypted_password",                    :null => false
    t.string   "preferences"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "announcementcategories", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "announcements", :force => true do |t|
    t.integer  "announcementcategory_id"
    t.string   "comune"
    t.string   "indirizzo"
    t.string   "titolo"
    t.string   "offrocerco"
    t.text     "descrizione"
    t.string   "email"
    t.string   "nome"
    t.string   "telefono"
    t.string   "sitoweb"
    t.boolean  "attivo"
    t.string   "permalink"
    t.string   "image1_file_name"
    t.string   "image1_content_type"
    t.integer  "image1_file_size"
    t.datetime "image1_updated_at"
    t.string   "image2_file_name"
    t.string   "image2_content_type"
    t.integer  "image2_file_size"
    t.datetime "image2_updated_at"
    t.string   "image3_file_name"
    t.string   "image3_content_type"
    t.integer  "image3_file_size"
    t.datetime "image3_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banners", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.string   "alt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "metatag"
    t.text     "description"
    t.string   "category_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.string   "big_image_alt"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "big_image_file_name"
    t.string   "big_image_content_type"
    t.integer  "big_image_file_size"
    t.datetime "big_image_updated_at"
    t.string   "permalink"
  end

end
