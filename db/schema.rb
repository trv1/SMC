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

ActiveRecord::Schema.define(version: 20150424082125) do

  create_table "doctors", force: :cascade do |t|
    t.string   "last_name",     null: false
    t.string   "first_name",    null: false
    t.string   "second_name",   null: false
    t.integer  "polyclinic_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "doctors", ["polyclinic_id"], name: "index_doctors_on_polyclinic_id"

  create_table "polyclinics", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "phone",      null: false
    t.string   "address",    null: false
    t.string   "district",   null: false
    t.string   "locality",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

# Could not dump table "polyclinics_posts" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "posts", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string   "number"
    t.integer  "polyclinic_id"
    t.integer  "post_id"
    t.integer  "schedule_id"
    t.integer  "routine_id"
    t.integer  "user_id"
    t.datetime "date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "requests", ["polyclinic_id"], name: "index_requests_on_polyclinic_id"
  add_index "requests", ["post_id"], name: "index_requests_on_post_id"
  add_index "requests", ["routine_id"], name: "index_requests_on_routine_id"
  add_index "requests", ["schedule_id"], name: "index_requests_on_schedule_id"
  add_index "requests", ["user_id"], name: "index_requests_on_user_id"

  create_table "routines", force: :cascade do |t|
    t.integer  "polyclinic_id"
    t.integer  "post_id"
    t.integer  "schedule_id"
    t.time     "timing"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "routines", ["polyclinic_id"], name: "index_routines_on_polyclinic_id"
  add_index "routines", ["post_id"], name: "index_routines_on_post_id"
  add_index "routines", ["schedule_id"], name: "index_routines_on_schedule_id"

  create_table "schedules", force: :cascade do |t|
    t.integer  "polyclinic_id"
    t.integer  "post_id"
    t.integer  "doctor_id"
    t.datetime "scheduleday",   null: false
    t.string   "cabinet",       null: false
    t.time     "time_begin",    null: false
    t.time     "time_end",      null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "schedules", ["doctor_id"], name: "index_schedules_on_doctor_id"
  add_index "schedules", ["polyclinic_id"], name: "index_schedules_on_polyclinic_id"
  add_index "schedules", ["post_id"], name: "index_schedules_on_post_id"

  create_table "users", force: :cascade do |t|
    t.string   "last_name",       limit: 50, null: false
    t.string   "first_name",      limit: 50, null: false
    t.string   "second_name",     limit: 50
    t.date     "birthday"
    t.string   "residence",                  null: false
    t.string   "sex"
    t.string   "passport",        limit: 10, null: false
    t.string   "policy",          limit: 10, null: false
    t.string   "email",                      null: false
    t.string   "login",                      null: false
    t.string   "password_digest"
    t.integer  "role"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "weekdaays", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weekdays", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
