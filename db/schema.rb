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

ActiveRecord::Schema.define(version: 20160305043124) do

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
  end

  add_index "groups_users", ["group_id"], name: "index_groups_users_on_group_id"
  add_index "groups_users", ["user_id"], name: "index_groups_users_on_user_id"

  create_table "payments", force: :cascade do |t|
    t.decimal  "amount"
    t.integer  "receiver_id"
    t.integer  "sender_id"
    t.string   "status",      default: "unpaid", null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "payments", ["receiver_id"], name: "index_payments_on_receiver_id"
  add_index "payments", ["sender_id"], name: "index_payments_on_sender_id"

  create_table "transfers", force: :cascade do |t|
    t.decimal  "amount"
    t.string   "transfer_method"
    t.integer  "payment_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "transfers", ["payment_id"], name: "index_transfers_on_payment_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
