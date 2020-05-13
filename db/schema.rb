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

ActiveRecord::Schema.define(version: 2020_05_13_180036) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charter_payments", force: :cascade do |t|
    t.bigint "charter_id"
    t.float "cantidad", default: 0.0
    t.date "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["charter_id"], name: "index_charter_payments_on_charter_id"
  end

  create_table "charters", force: :cascade do |t|
    t.bigint "user_id"
    t.string "alias"
    t.string "rfc"
    t.string "razon_social"
    t.string "direccion"
    t.string "encargado"
    t.string "telefono_encargado"
    t.string "correo_encargado"
    t.string "codigo_fletera"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "precio_de_envio", default: 0
    t.index ["user_id"], name: "index_charters_on_user_id"
  end

  create_table "clients", force: :cascade do |t|
    t.bigint "user_id"
    t.string "alias"
    t.string "rfc"
    t.string "razon_social"
    t.string "direccion"
    t.string "planta"
    t.string "codigo_empresa"
    t.string "codigo_planta"
    t.string "numero_proveedor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "client_id"
    t.bigint "product_id"
    t.string "numero_de_orden"
    t.date "fecha_de_orden"
    t.string "nombre_encargado"
    t.float "cantidad"
    t.string "descripcion"
    t.float "precio_unitario"
    t.float "valor_total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.float "iva_pedido", default: 0.0
    t.boolean "closed", default: false
    t.boolean "cerrado", default: false
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["product_id"], name: "index_orders_on_product_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "user_id"
    t.string "nombre"
    t.string "codigo_producto"
    t.string "caracteristicas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "costo_producto", default: 0.0
    t.string "alias"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "provider_payments", force: :cascade do |t|
    t.bigint "provider_id"
    t.float "cantidad", default: 0.0
    t.date "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_provider_payments_on_provider_id"
  end

  create_table "providers", force: :cascade do |t|
    t.bigint "user_id"
    t.string "alias"
    t.string "rfc"
    t.string "razon_social"
    t.string "direccion"
    t.string "encargado"
    t.string "telefono_encargado"
    t.string "correo_encargado"
    t.string "codigo_proveedor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_providers_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "order_id"
    t.float "cantidad", default: 0.0
    t.date "fecha_de_entrega"
    t.string "status_operativo"
    t.string "status_comercial"
    t.string "etapa"
    t.bigint "provider_id"
    t.boolean "requiere_factura_p", default: false
    t.float "pago_a_proveedor", default: 0.0
    t.text "condiciones_p"
    t.boolean "pagado_proveedor", default: false
    t.bigint "charter_id"
    t.boolean "requiere_factura_f", default: false
    t.float "pago_a_fletera", default: 0.0
    t.text "condiciones_f"
    t.boolean "pagado_fletera", default: false
    t.string "codigo_remision"
    t.boolean "remision_enviada", default: false
    t.boolean "calidad_enviada", default: false
    t.boolean "seguridad_enviada", default: false
    t.boolean "otro_enviada", default: false
    t.float "gasto_operacion", default: 0.0
    t.boolean "remision_sellada", default: false
    t.boolean "tickets", default: false
    t.float "cantidad_real_etregada", default: 0.0
    t.float "pago_real_p", default: 0.0
    t.boolean "factura_recibida_p", default: false
    t.boolean "factura_recibida_f", default: false
    t.string "gr"
    t.string "numero_de_factura"
    t.float "kilos_finales", default: 0.0
    t.float "total_por_facturar", default: 0.0
    t.date "fecha_de_facturacion"
    t.date "fecha_por_cobrar"
    t.boolean "pagado", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "total_venta", default: 0.0
    t.float "ganancia", default: 0.0
    t.float "proveedor", default: 0.0
    t.float "fletera", default: 0.0
    t.float "iva_proveedor", default: 0.0
    t.float "iva_fletera", default: 0.0
    t.index ["charter_id"], name: "index_services_on_charter_id"
    t.index ["order_id"], name: "index_services_on_order_id"
    t.index ["provider_id"], name: "index_services_on_provider_id"
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "nombre"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "charter_payments", "charters"
  add_foreign_key "charters", "users"
  add_foreign_key "clients", "users"
  add_foreign_key "orders", "clients"
  add_foreign_key "orders", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "users"
  add_foreign_key "provider_payments", "providers"
  add_foreign_key "providers", "users"
  add_foreign_key "services", "charters"
  add_foreign_key "services", "orders"
  add_foreign_key "services", "providers"
  add_foreign_key "services", "users"
end
