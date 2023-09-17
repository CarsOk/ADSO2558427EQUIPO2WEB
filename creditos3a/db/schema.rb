# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_09_16_201628) do

  create_table "catalogos", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categorias", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "catalogo_id", null: false
    t.index ["catalogo_id"], name: "index_categorias_on_catalogo_id"
  end

  create_table "contactospqrs", force: :cascade do |t|
    t.string "nombre"
    t.string "email"
    t.string "asunto"
    t.text "mensaje"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "productos", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.string "file"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "avatar"
    t.integer "categoria_id", null: false
    t.index ["categoria_id"], name: "index_productos_on_categoria_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "second_name"
    t.string "last_name_1"
    t.string "last_name_2"
    t.string "address"
    t.integer "identification"
    t.boolean "administrador"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "categorias", "catalogos"
  add_foreign_key "productos", "categorias"
end
