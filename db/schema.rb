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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_08_03_095522) do

  create_table "channels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ch_id", null: false
    t.string "name", null: false
    t.string "ch_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "channel_name"
    t.string "main_type"
    t.string "sub_type"
    t.string "user"
    t.text "text"
    t.string "client_msg_id"
    t.string "ts"
    t.text "reactions"
    t.string "inviter"
    t.string "edited_user"
    t.string "edited_ts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
