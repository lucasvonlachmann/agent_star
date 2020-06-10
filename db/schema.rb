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

ActiveRecord::Schema.define(version: 2020_06_10_162747) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carriers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "checklist_root_causes", force: :cascade do |t|
    t.bigint "checklist_id"
    t.bigint "root_cause_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checklist_id"], name: "index_checklist_root_causes_on_checklist_id"
    t.index ["root_cause_id"], name: "index_checklist_root_causes_on_root_cause_id"
  end

  create_table "checklists", force: :cascade do |t|
    t.bigint "scale_id"
    t.integer "draft_arrival"
    t.integer "tugs_arrival"
    t.datetime "eosp"
    t.datetime "pob_arrival"
    t.datetime "berthed"
    t.datetime "gangway_ready"
    t.datetime "started_ops"
    t.datetime "completed_ops"
    t.datetime "terminal_requested"
    t.datetime "pob_departure"
    t.datetime "last_line"
    t.integer "draft_departure"
    t.integer "tugs_departure"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scale_id"], name: "index_checklists_on_scale_id"
  end

  create_table "kpis", force: :cascade do |t|
    t.bigint "carrier_id"
    t.string "name"
    t.integer "taget"
    t.integer "max_limit"
    t.integer "min_limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_kpis_on_carrier_id"
  end

  create_table "ports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "root_causes", force: :cascade do |t|
    t.bigint "kpi_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kpi_id"], name: "index_root_causes_on_kpi_id"
  end

  create_table "scales", force: :cascade do |t|
    t.bigint "vessel_id"
    t.bigint "carrier_id"
    t.string "voyage"
    t.string "service"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "port_id"
    t.index ["carrier_id"], name: "index_scales_on_carrier_id"
    t.index ["port_id"], name: "index_scales_on_port_id"
    t.index ["vessel_id"], name: "index_scales_on_vessel_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vessels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "checklist_root_causes", "checklists"
  add_foreign_key "checklist_root_causes", "root_causes"
  add_foreign_key "checklists", "scales"
  add_foreign_key "kpis", "carriers"
  add_foreign_key "root_causes", "kpis"
  add_foreign_key "scales", "carriers"
  add_foreign_key "scales", "ports"
  add_foreign_key "scales", "vessels"
end
