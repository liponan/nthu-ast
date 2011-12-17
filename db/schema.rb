# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111217072612) do

  create_table "block_types", :force => true do |t|
    t.string   "name"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blocks", :force => true do |t|
    t.integer  "block_type_id"
    t.string   "time"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "program_id"
  end

  create_table "club_activities", :force => true do |t|
    t.boolean  "club",       :default => false
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "email"
    t.string   "unit"
    t.string   "title"
    t.string   "phone"
    t.string   "mobile"
    t.string   "fax"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_statuses", :force => true do |t|
    t.string   "name"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faqs", :force => true do |t|
    t.string   "question"
    t.string   "answer"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "program_items", :force => true do |t|
    t.integer  "program_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programs", :force => true do |t|
    t.string   "name",                                            :null => false
    t.string   "audience",                       :default => "0", :null => false
    t.string   "date"
    t.integer  "event_status_id",                :default => 0,   :null => false
    t.integer  "block_1",                        :default => 0,   :null => false
    t.integer  "block_2",                        :default => 0,   :null => false
    t.integer  "block_3",                        :default => 0,   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pid",             :limit => nil
  end

  create_table "users", :force => true do |t|
    t.string   "userid"
    t.string   "email"
    t.string   "password"
    t.string   "name"
    t.string   "unit"
    t.string   "title"
    t.string   "phone"
    t.string   "mobile"
    t.string   "fax"
    t.integer  "power",      :default => 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
