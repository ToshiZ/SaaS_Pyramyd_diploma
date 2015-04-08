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

ActiveRecord::Schema.define(version: 20150319031445) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "ssh_connections", force: :cascade do |t|
    t.string   "name"
    t.string   "ip"
    t.string   "login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "password"
  end

  create_table "task_templates", force: :cascade do |t|
    t.string   "name"
    t.boolean  "historyenabled"
    t.string   "description"
    t.string   "stopcode"
    t.string   "resultcode"
    t.string   "dir"
    t.boolean  "nfs"
    t.integer  "checkpoint"
    t.string   "logPath"
    t.boolean  "logNfs"
    t.boolean  "logEpk"
    t.boolean  "logCluster"
    t.boolean  "logNode"
    t.integer  "portionCluster"
    t.integer  "portionNode"
    t.integer  "portionProgram"
    t.string   "parameters"
    t.string   "parametersDescription"
    t.string   "profiles"
    t.string   "profilesDescription"
    t.string   "passportName"
    t.integer  "procNum"
    t.integer  "maxTime"
    t.string   "taskName"
    t.integer  "userId"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.text     "mqinfo"
    t.text     "stdout_rez"
    t.text     "work_status"
    t.text     "errors_suppz"
    t.text     "manager_log"
    t.text     "output_suppz"
    t.string   "status_suppz"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "output_status_suppz"
  end

  create_table "templates", force: :cascade do |t|
    t.string   "taskName"
    t.string   "taskDescription"
    t.string   "passportName"
    t.string   "name"
    t.integer  "procNum"
    t.integer  "maxTime"
    t.boolean  "historyenabled"
    t.string   "description"
    t.integer  "stopcode"
    t.integer  "resultcode"
    t.string   "dir"
    t.boolean  "nfs"
    t.integer  "checkpoint"
    t.string   "logPath"
    t.boolean  "logNfs"
    t.boolean  "logEpk"
    t.boolean  "logCluster"
    t.boolean  "logNode"
    t.integer  "portionCluster"
    t.integer  "portionNode"
    t.integer  "portionProgram"
    t.string   "parameters"
    t.string   "parametersDescription"
    t.string   "profiles"
    t.string   "profilesDescription"
    t.string   "otherParams"
    t.integer  "userId"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "user_tasks", force: :cascade do |t|
    t.string   "name"
    t.text     "mqinfo"
    t.text     "stdout_rez"
    t.text     "work_status"
    t.text     "errors"
    t.text     "manager_log"
    t.text     "output"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_connections", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "ssh_connection_id"
  end

  add_index "users_connections", ["ssh_connection_id"], name: "index_users_connections_on_ssh_connection_id"
  add_index "users_connections", ["user_id"], name: "index_users_connections_on_user_id"

end
