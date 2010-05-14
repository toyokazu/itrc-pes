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

ActiveRecord::Schema.define(:version => 20100510085208) do

  create_table "evaluations", :force => true do |t|
    t.integer  "presentation_id"
    t.string   "valuator"
    t.datetime "date"
    t.float    "presentation_allotment"
    t.float    "presentation_story"
    t.float    "speaker_wording"
    t.float    "degree_of_understanding"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meetings", :force => true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presentations", :force => true do |t|
    t.integer  "meeting_id"
    t.string   "speaker"
    t.string   "collaborator"
    t.string   "affiliation"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
