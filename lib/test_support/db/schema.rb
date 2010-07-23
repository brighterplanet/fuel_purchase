require 'sniff/database'

Sniff::Database.define_schema do
  create_table "fuel_purchase_records", :force => true do |t|
    t.string   "fuel_type_id"
    t.float    "volume"
    t.string   "volume_units"
    t.float    "cost"
    t.string   "cost_units"
    t.float    "price"
    t.string   "price_units"
    t.string   "zip_code_id"
    t.string   "state_id"
    t.string   "petroleum_administration_for_defense_district_id"
    t.date     "date"
    t.datetime "updated_at"
    t.datetime "created_at"
  end
end
