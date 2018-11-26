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

ActiveRecord::Schema.define(version: 2018_11_22_074510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_accounts_on_unlock_token", unique: true
  end

  create_table "ballots", id: false, force: :cascade do |t|
    t.string "id", null: false
    t.bigint "candidate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "voted", default: false
    t.bigint "election_id"
    t.index ["candidate_id"], name: "index_ballots_on_candidate_id"
    t.index ["election_id"], name: "index_ballots_on_election_id"
    t.index ["id"], name: "index_ballots_on_id", unique: true
  end

  create_table "candidates", force: :cascade do |t|
    t.string "name"
    t.integer "votes_count", default: 0
    t.bigint "election_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.boolean "accepted_election_invitation", default: false
    t.index ["election_id"], name: "index_candidates_on_election_id"
  end

  create_table "elections", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "voters_count", default: 0
    t.integer "candidates_count", default: 0
    t.integer "ballots_count", default: 0
    t.bigint "account_id"
    t.index ["account_id"], name: "index_elections_on_account_id"
  end

  create_table "voters", force: :cascade do |t|
    t.string "email"
    t.bigint "election_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["election_id"], name: "index_voters_on_election_id"
  end

  add_foreign_key "ballots", "candidates"
  add_foreign_key "ballots", "elections"
  add_foreign_key "candidates", "elections"
  add_foreign_key "elections", "accounts"
  add_foreign_key "voters", "elections"
end
