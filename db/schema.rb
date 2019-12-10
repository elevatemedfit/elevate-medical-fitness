# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_09_194557) do

  create_table "exercises", force: :cascade do |t|
    t.integer "sets"
    t.integer "reps"
    t.string "target"
    t.string "name"
    t.integer "workout_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "goals", force: :cascade do |t|
    t.integer "patient_id"
    t.string "description"
    t.boolean "accomplished", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "accomplished_at"
  end

  create_table "patient_workouts", id: false, force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "workout_id", null: false
    t.boolean "completed"
    t.index ["patient_id", "workout_id"], name: "index_patient_workouts_on_patient_id_and_workout_id"
    t.index ["workout_id", "patient_id"], name: "index_patient_workouts_on_workout_id_and_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.datetime "date"
    t.string "physician"
    t.string "condition"
    t.integer "height"
    t.integer "weight"
    t.integer "step_count"
    t.integer "cardio_fitness_level"
    t.integer "caloric_burn"
    t.integer "distance"
    t.integer "active_minutes"
    t.string "precautions"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "bmi"
    t.integer "age"
    t.integer "health_score"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "duration"
    t.string "difficulty"
  end

end
