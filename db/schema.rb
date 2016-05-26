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

ActiveRecord::Schema.define(version: 20160526080936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "application_choices", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.integer  "choice",                null: false
    t.uuid     "application_id"
    t.uuid     "study_program_mode_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "applications", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "status",                     null: false
    t.string   "application_number",         null: false
    t.datetime "submission_date",            null: false
    t.uuid     "user_id"
    t.uuid     "enrollment_id"
    t.uuid     "highschool_id"
    t.uuid     "post_of_residence_id"
    t.uuid     "post_for_notification_id"
    t.uuid     "citizen_id"
    t.uuid     "municipality_id"
    t.uuid     "country_of_birth_id"
    t.uuid     "country_of_residence_id"
    t.uuid     "highschool_country_id"
    t.uuid     "highschool_completion_id"
    t.uuid     "klasius_srvs_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "maiden_name"
    t.date     "date_of_birth"
    t.string   "sex"
    t.string   "phone"
    t.string   "EMSO"
    t.string   "place_of_residence"
    t.string   "firstname_for_notification"
    t.string   "lastname_for_notification"
    t.string   "place_for_notification"
    t.boolean  "highschool_certificate"
    t.date     "highschool_finished_date"
    t.boolean  "repeater"
    t.boolean  "absolvent"
    t.boolean  "diplomant"
    t.boolean  "student"
  end

  create_table "citizens", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "code",                      null: false
    t.string   "name",                      null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "is_valid",   default: true
  end

  create_table "countries", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "code",                      null: false
    t.string   "name",                      null: false
    t.boolean  "eu_member",                 null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "is_valid",   default: true
  end

  create_table "elements", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "code",                      null: false
    t.string   "name",                      null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "is_valid",   default: true
  end

  create_table "enrollments", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "study_year",                null: false
    t.datetime "start",                     null: false
    t.datetime "end",                       null: false
    t.boolean  "current",                   null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "is_valid",   default: true
  end

  create_table "higher_education_institutions", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "code",                           null: false
    t.string   "name",                           null: false
    t.string   "acronym",                        null: false
    t.uuid     "university_id"
    t.uuid     "municipality_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "is_valid",        default: true
  end

  create_table "highschool_completions", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "code",                      null: false
    t.string   "name",                      null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "is_valid",   default: true
  end

  create_table "highschools", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "code",                      null: false
    t.string   "name",                      null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "is_valid",   default: true
  end

  create_table "klasius_srvs", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "code",                          null: false
    t.string   "description_sl",                null: false
    t.string   "description_en"
    t.string   "parent"
    t.string   "level"
    t.boolean  "is_valid",       default: true
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "mode_of_studies", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "code",                      null: false
    t.string   "name",                      null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "is_valid",   default: true
  end

  create_table "municipalities", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "code",                      null: false
    t.string   "name",                      null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "is_valid",   default: true
  end

  create_table "posts", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "code",                      null: false
    t.string   "name",                      null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "is_valid",   default: true
  end

  create_table "professions", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "code",                      null: false
    t.string   "name",                      null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "is_valid",   default: true
  end

  create_table "requirement_elements", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "requirement_id"
    t.uuid     "element_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "requirement_elements", ["element_id"], name: "index_requirement_elements_on_element_id", using: :btree
  add_index "requirement_elements", ["requirement_id"], name: "index_requirement_elements_on_requirement_id", using: :btree

  create_table "requirements", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "study_program_id"
    t.uuid     "highschool_completion_id"
    t.uuid     "profession_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "requirements", ["highschool_completion_id"], name: "index_requirements_on_highschool_completion_id", using: :btree
  add_index "requirements", ["profession_id"], name: "index_requirements_on_profession_id", using: :btree
  add_index "requirements", ["study_program_id"], name: "index_requirements_on_study_program_id", using: :btree

  create_table "roles", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.uuid     "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_valid",      default: true
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "study_program_elements", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "requirement_id", null: false
    t.uuid     "element_id",     null: false
    t.float    "weight",         null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "study_program_elements", ["element_id"], name: "index_study_program_elements_on_element_id", using: :btree
  add_index "study_program_elements", ["requirement_id"], name: "index_study_program_elements_on_requirement_id", using: :btree

  create_table "study_program_modes", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.integer  "number_of_places"
    t.integer  "number_of_places_foreign"
    t.integer  "number_of_places_after_selection"
    t.integer  "number_of_places_after_selection_foreign"
    t.integer  "selected"
    t.integer  "selected_foreign"
    t.float    "selection_limit"
    t.uuid     "study_program_id"
    t.uuid     "mode_of_study_id"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.boolean  "is_valid",                                 default: true
  end

  create_table "study_programs", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name",                                           null: false
    t.string   "code",                                           null: false
    t.uuid     "higher_education_institution_id",                null: false
    t.uuid     "type_of_study_id",                               null: false
    t.uuid     "enrollment_id",                                  null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.boolean  "is_valid",                        default: true
  end

  create_table "type_of_studies", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "code",                      null: false
    t.string   "name",                      null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "is_valid",   default: true
  end

  create_table "universities", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "code",                      null: false
    t.string   "name",                      null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "is_valid",   default: true
  end

  create_table "users", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "username",                            null: false
    t.string   "firstname",                           null: false
    t.string   "lastname",                            null: false
    t.datetime "disabled_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "requirement_elements", "elements"
  add_foreign_key "requirement_elements", "requirements"
  add_foreign_key "requirements", "highschool_completions"
  add_foreign_key "requirements", "professions"
  add_foreign_key "requirements", "study_programs"
  add_foreign_key "study_program_elements", "elements"
  add_foreign_key "study_program_elements", "requirements"
end
