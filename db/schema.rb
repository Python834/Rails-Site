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

ActiveRecord::Schema.define(version: 20141206213109) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.date     "published_date"
    t.boolean  "published"
    t.text     "content"
    t.string   "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blogs", force: true do |t|
    t.string   "title"
    t.date     "published_date"
    t.string   "author"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "author"
    t.text     "opinion"
    t.integer  "rating"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["product_id"], name: "index_comments_on_product_id"

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "quantity"
    t.float    "selling_price"
    t.float    "cost_of_products"
    t.float    "weight"
    t.string   "thumbnail"
    t.string   "full_image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "reviews", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "opinion"
    t.integer  "rating"
    t.string   "thumbnail"
    t.integer  "blog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["blog_id"], name: "index_reviews_on_blog_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.boolean  "newsletter"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
