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

ActiveRecord::Schema.define(version: 20170528015419) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "certifications", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "certifications_items", id: false, force: :cascade do |t|
    t.integer "certification_id", null: false
    t.integer "item_id",          null: false
    t.index ["certification_id", "item_id"], name: "index_certifications_items_on_certification_id_and_item_id", using: :btree
    t.index ["item_id", "certification_id"], name: "index_certifications_items_on_item_id_and_certification_id", using: :btree
  end

  create_table "certifiers", force: :cascade do |t|
    t.string   "organization"
    t.integer  "certification_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["certification_id"], name: "index_certifiers_on_certification_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendor_certifiers", force: :cascade do |t|
    t.integer  "vendor_id"
    t.integer  "certifier_id"
    t.date     "expires_on"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["certifier_id"], name: "index_vendor_certifiers_on_certifier_id", using: :btree
    t.index ["vendor_id"], name: "index_vendor_certifiers_on_vendor_id", using: :btree
  end

  create_table "vendors", force: :cascade do |t|
    t.string   "name"
    t.string   "contact"
    t.text     "contact_email"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_foreign_key "certifiers", "certifications"
  add_foreign_key "vendor_certifiers", "certifiers"
  add_foreign_key "vendor_certifiers", "vendors"
end
