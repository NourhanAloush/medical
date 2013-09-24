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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130923123814) do

  create_table "diseases", force: true do |t|
    t.string "name"
    t.string "emp_id"
  end

  create_table "employees", force: true do |t|
    t.string   "name"
    t.string   "employee_id"
    t.string   "department"
    t.string   "blood_group"
    t.datetime "date_of_birth"
    t.string   "Transfer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "emp_date"
    t.string   "mobile"
    t.string   "deptType"
    t.string   "done"
    t.string   "card"
    t.string   "special"
  end

  create_table "exams", force: true do |t|
    t.string   "name"
    t.integer  "max"
    t.integer  "min"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medical_exams", force: true do |t|
    t.string   "emp_id"
    t.string   "exam_type"
    t.datetime "exam_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", force: true do |t|
    t.string   "patient_id"
    t.string   "clinic"
    t.string   "clinic_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "table_users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "mobile"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "mobile"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.string   "password_digest"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "vaccines", force: true do |t|
    t.string "name"
    t.string "emp_id"
  end

end
