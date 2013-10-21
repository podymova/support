# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20131020042131) do

  create_table "bugs", :force => true do |t|
    t.integer  "user_id"
    t.text     "body"
    t.string   "state"
    t.string   "responce"
    t.string   "subject"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "dmovings", :force => true do |t|
    t.integer  "dev_id"
    t.integer  "nod_from"
    t.integer  "nod_to"
    t.text     "comment"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "group_sections", :force => true do |t|
    t.string   "name"
    t.string   "section"
    t.string   "link"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hardware_topologies", :force => true do |t|
    t.integer  "hardware_id"
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "state"
    t.integer  "order"
  end

  create_table "hardwares", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "state"
    t.integer  "order"
  end

  create_table "mastercomps", :force => true do |t|
    t.string   "name"
    t.integer  "street_id"
    t.integer  "house_id"
    t.integer  "flat_id"
    t.integer  "user_id"
    t.string   "state"
    t.integer  "order"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.text     "body"
    t.string   "state"
    t.string   "responce"
    t.string   "subject"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "model_actions", :force => true do |t|
    t.integer  "model_id"
    t.string   "name"
    t.string   "state"
    t.integer  "order"
    t.string   "full"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "models", :force => true do |t|
    t.string   "name"
    t.string   "state"
    t.integer  "order"
    t.string   "section"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "full"
  end

  create_table "node_devs", :force => true do |t|
    t.integer  "node_id"
    t.integer  "dev_id"
    t.string   "item"
    t.text     "comment"
    t.integer  "quantity"
    t.string   "service_state"
    t.string   "inumber"
    t.string   "snumber"
    t.string   "ip"
    t.string   "mac"
    t.integer  "entrance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "node_devs", ["node_id", "inumber"], :name => "index_node_devs_on_node_id_and_inumber", :unique => true

  create_table "nodes", :force => true do |t|
    t.integer  "house_id"
    t.integer  "order"
    t.string   "mvlan"
    t.string   "cvlan"
    t.string   "state"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "street_id"
    t.integer  "entrance"
    t.string   "item"
    t.text     "comment"
    t.integer  "quantity"
    t.string   "service_state"
    t.string   "inumber"
  end

  add_index "nodes", ["street_id", "house_id", "entrance"], :name => "index_nodes_on_street_id_and_house_id_and_entrance", :unique => true
  add_index "nodes", ["street_id", "house_id"], :name => "index_nodes_on_street_id_and_house_id", :unique => true

  create_table "ppr_attaches", :force => true do |t|
    t.integer  "ppr_id"
    t.string   "asset"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "filename"
  end

  create_table "ppr_comments", :force => true do |t|
    t.integer  "ppr_id"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ppr_hards", :force => true do |t|
    t.integer  "ppr_id"
    t.integer  "hardware_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ppr_release_attaches", :force => true do |t|
    t.integer  "release_id"
    t.integer  "ppr_id"
    t.string   "asset"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "image"
  end

  create_table "ppr_release_comments", :force => true do |t|
    t.integer  "release_id"
    t.integer  "ppr_id"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ppr_release_hards", :force => true do |t|
    t.integer  "release_id"
    t.integer  "ppr_id"
    t.integer  "hardware_id"
    t.integer  "topology_id"
    t.string   "value"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "ppr_release_tops", :force => true do |t|
    t.integer "hard_id"
    t.integer "topology_id"
    t.string  "value"
  end

  create_table "ppr_release_users", :force => true do |t|
    t.integer "release_id"
    t.integer "ppr_id"
    t.integer "user_id"
  end

  create_table "ppr_releases", :force => true do |t|
    t.integer  "ppr_id"
    t.integer  "user_id"
    t.integer  "manager"
    t.text     "resume"
    t.text     "tasks_list"
    t.datetime "date2ispoln"
    t.datetime "date2end"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "ppr_tops", :force => true do |t|
    t.integer "hard_id"
    t.integer "topology_id"
    t.string  "value"
    t.string  "title"
  end

  create_table "ppr_users", :force => true do |t|
    t.integer "ppr_id"
    t.integer "user_id"
  end

  create_table "pprs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "street_id"
    t.integer  "house_id"
    t.integer  "entrance"
    t.integer  "floor"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "manager"
    t.text     "resume"
    t.datetime "date_to_inspoln"
    t.datetime "date_to_end"
    t.text     "tasks_list"
  end

  create_table "processors", :force => true do |t|
    t.string   "name"
    t.string   "class"
    t.string   "attr"
    t.string   "state"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "providers", :force => true do |t|
    t.string   "name"
    t.string   "class_name"
    t.string   "attr"
    t.string   "state"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "role_rights", :force => true do |t|
    t.integer  "model_id"
    t.string   "full_name"
    t.integer  "role_id"
    t.boolean  "ashow"
    t.boolean  "aedit"
    t.boolean  "adelete"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "role_users", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.string   "fullname"
    t.string   "phone"
    t.string   "email"
    t.string   "state"
    t.boolean  "admin"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "state"
    t.integer  "order"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "type"
    t.string   "type_state"
  end

  create_table "services", :force => true do |t|
    t.string   "dictionary"
    t.integer  "inserted"
    t.integer  "updated"
    t.integer  "deleted"
    t.integer  "user"
    t.boolean  "update"
    t.boolean  "clear"
    t.text     "info"
    t.string   "state"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "settings", :force => true do |t|
    t.string   "per_page"
    t.string   "pages_interval"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "street_houses", :force => true do |t|
    t.string   "st_short"
    t.integer  "street_id"
    t.string   "number"
    t.integer  "entrances"
    t.integer  "floors"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "mastercomp_id"
    t.string   "state"
  end

  create_table "streets", :force => true do |t|
    t.string   "short"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "state"
  end

  create_table "tcabel_cabels", :force => true do |t|
    t.string   "inumber"
    t.string   "length"
    t.text     "comment"
    t.string   "state"
    t.integer  "order"
    t.integer  "tcabel_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tcabels", :force => true do |t|
    t.string   "name"
    t.string   "prefix"
    t.string   "state"
    t.string   "order"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tdev_devs", :force => true do |t|
    t.string   "inumber"
    t.string   "snumber"
    t.string   "ip"
    t.string   "mac"
    t.string   "state"
    t.integer  "order"
    t.integer  "user_id"
    t.integer  "tdev_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "producer"
    t.string   "model"
    t.string   "power"
  end

  add_index "tdev_devs", ["producer", "model"], :name => "index_tdev_devs_on_producer_and_model", :unique => true

  create_table "tdevs", :force => true do |t|
    t.string   "model"
    t.string   "state"
    t.integer  "order"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.string   "fullname"
    t.string   "phone"
    t.string   "email"
    t.string   "state"
    t.string   "type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.boolean  "admin"
    t.integer  "group_id"
  end

end
