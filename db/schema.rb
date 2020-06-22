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

ActiveRecord::Schema.define(version: 2020_06_22_155450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id", "version"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

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
    t.string "remarks"
    t.index ["scale_id"], name: "index_checklists_on_scale_id"
  end

  create_table "kpi_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "vw_name"
  end

  create_table "kpis", force: :cascade do |t|
    t.bigint "carrier_id"
    t.integer "target"
    t.integer "max_limit"
    t.integer "min_limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "port_id"
    t.bigint "kpi_type_id"
    t.index ["carrier_id"], name: "index_kpis_on_carrier_id"
    t.index ["kpi_type_id"], name: "index_kpis_on_kpi_type_id"
    t.index ["port_id"], name: "index_kpis_on_port_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "ports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "root_causes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "kpi_type_id"
    t.index ["kpi_type_id"], name: "index_root_causes_on_kpi_type_id"
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
  add_foreign_key "kpis", "kpi_types"
  add_foreign_key "kpis", "ports"
  add_foreign_key "root_causes", "kpi_types"
  add_foreign_key "scales", "carriers"
  add_foreign_key "scales", "ports"
  add_foreign_key "scales", "vessels"

  create_view "vw_checklists", sql_definition: <<-SQL
      SELECT s.id AS scale_id,
      s.carrier_id,
      ca.name AS carrier_name,
      s.port_id,
      p.name AS port_name,
      s.vessel_id,
      v.name AS vessel_name,
      s.voyage,
      s.service,
      c.draft_arrival,
      c.tugs_arrival,
      c.eosp,
      c.pob_arrival,
      c.berthed,
      c.gangway_ready,
      c.started_ops,
      c.completed_ops,
      c.terminal_requested,
      c.pob_departure,
      c.last_line,
      c.draft_departure,
      c.tugs_departure,
      c.remarks,
      ((((date_part('day'::text, (c.berthed - c.eosp)) * (24)::double precision) + date_part('hour'::text, (c.berthed - c.eosp))) * (60)::double precision) + date_part('minute'::text, (c.berthed - c.eosp))) AS waiting_time,
      ((((date_part('day'::text, (c.started_ops - c.berthed)) * (24)::double precision) + date_part('hour'::text, (c.started_ops - c.berthed))) * (60)::double precision) + date_part('minute'::text, (c.started_ops - c.berthed))) AS idle_time_arrival,
      ((((date_part('day'::text, (c.last_line - c.completed_ops)) * (24)::double precision) + date_part('hour'::text, (c.last_line - c.completed_ops))) * (60)::double precision) + date_part('minute'::text, (c.last_line - c.completed_ops))) AS idle_time_departure
     FROM ((((scales s
       JOIN checklists c ON ((s.id = c.scale_id)))
       JOIN ports p ON ((s.port_id = p.id)))
       JOIN carriers ca ON ((s.carrier_id = ca.id)))
       JOIN vessels v ON ((s.vessel_id = v.id)));
  SQL
  create_view "vw_checklist_kpis", sql_definition: <<-SQL
      WITH aux AS (
           SELECT vc.scale_id,
              vc.carrier_id,
              vc.carrier_name,
              vc.port_id,
              vc.port_name,
              vc.waiting_time,
              vc.idle_time_arrival,
              vc.idle_time_departure,
              kt.id AS kpi_type_id,
              kt.name AS kpi_name,
              k.id AS kpi_id,
              k.target AS kpi_target,
                  CASE
                      WHEN ((kt.vw_name)::text = 'idle_time_arrival'::text) THEN ((k.target)::double precision - vc.idle_time_arrival)
                      WHEN ((kt.vw_name)::text = 'idle_time_departure'::text) THEN ((k.target)::double precision - vc.idle_time_departure)
                      WHEN ((kt.vw_name)::text = 'waiting_time'::text) THEN ((k.target)::double precision - vc.waiting_time)
                      ELSE (0)::double precision
                  END AS target_minus_actual
             FROM ((vw_checklists vc
               JOIN kpis k ON (((k.carrier_id = vc.carrier_id) AND (k.port_id = vc.port_id))))
               JOIN kpi_types kt ON ((kt.id = k.kpi_type_id)))
          )
   SELECT aux.scale_id,
      aux.carrier_id,
      aux.carrier_name,
      aux.port_id,
      aux.port_name,
      aux.waiting_time,
      aux.idle_time_arrival,
      aux.idle_time_departure,
      aux.kpi_type_id,
      aux.kpi_name,
      aux.kpi_id,
      aux.kpi_target,
      aux.target_minus_actual,
          CASE
              WHEN (aux.target_minus_actual >= (0)::double precision) THEN 'In'::text
              WHEN (aux.target_minus_actual < (0)::double precision) THEN 'Out'::text
              ELSE 'x'::text
          END AS target_in_out
     FROM aux;
  SQL
  create_view "vw_checklist_root_causes", sql_definition: <<-SQL
      SELECT s.id AS scale_id,
      c.id AS checklist_id,
      rc.id AS root_cause_id,
      rc.name,
      kt.id AS kpi_type_id,
      kt.name AS kpi_type_name
     FROM ((((checklist_root_causes crc
       JOIN checklists c ON ((crc.checklist_id = c.id)))
       JOIN scales s ON ((s.id = c.scale_id)))
       JOIN root_causes rc ON ((crc.root_cause_id = rc.id)))
       JOIN kpi_types kt ON ((kt.id = rc.kpi_type_id)));
  SQL
end
