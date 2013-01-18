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

ActiveRecord::Schema.define(:version => 20130117220510) do

  create_table "employees", :force => true do |t|
    t.string   "employee_name"
    t.string   "employee_email"
    t.string   "location"
    t.string   "department"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "years_with_company"
    t.string   "manager"
    t.string   "position"
    t.string   "group"
    t.string   "current_skill"
    t.string   "skills_interested_in"
    t.string   "password_digest"
    t.string   "password"
    t.string   "password_confirmation"
    t.string   "remember_token"
    t.string   "description"
    t.string   "last_name"
  end

  add_index "employees", ["remember_token"], :name => "index_employees_on_remember_token"

  create_table "project_requests", :force => true do |t|
    t.string   "project_help"
    t.integer  "employee_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "status"
    t.string   "title"
    t.string   "relevant_skill"
    t.string   "office"
    t.string   "group"
  end

  create_table "request_selections", :force => true do |t|
    t.integer  "project_request_id"
    t.integer  "employee_id"
    t.integer  "response_id"
    t.string   "comment"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "responses", :force => true do |t|
    t.string   "message"
    t.integer  "employee_id"
    t.integer  "project_request_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "skills", :force => true do |t|
    t.string   "language"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
