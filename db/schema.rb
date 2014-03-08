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

ActiveRecord::Schema.define(version: 20140308034107) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "affiliations", force: true do |t|
    t.integer  "profile_id"
    t.integer  "organization_id"
    t.date     "began_on",                       null: false
    t.date     "ended_on"
    t.boolean  "is_active",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "affiliations", ["organization_id"], name: "index_affiliations_on_organization_id", using: :btree
  add_index "affiliations", ["profile_id"], name: "index_affiliations_on_profile_id", using: :btree

  create_table "articles", force: true do |t|
    t.string   "title",                       null: false
    t.text     "body",                        null: false
    t.string   "blog_image"
    t.string   "slug",                        null: false
    t.boolean  "is_archived", default: false
    t.integer  "user_id",                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["article_id"], name: "index_categories_on_article_id", using: :btree
  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree

  create_table "comments", force: true do |t|
    t.text     "body",       null: false
    t.integer  "article_id"
    t.integer  "comment_id"
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id", using: :btree
  add_index "comments", ["comment_id"], name: "index_comments_on_comment_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "contacts", force: true do |t|
    t.string   "email",           null: false
    t.string   "subject",         null: false
    t.text     "body",            null: false
    t.integer  "user_id"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["organization_id"], name: "index_contacts_on_organization_id", using: :btree
  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id", using: :btree

  create_table "organizations", force: true do |t|
    t.string   "slug"
    t.string   "name"
    t.text     "description"
    t.string   "pitch"
    t.string   "logo"
    t.date     "founded_on"
    t.string   "home_page"
    t.boolean  "is_active",   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.string   "profile_type"
    t.string   "profile_name"
    t.string   "name_given"
    t.string   "name_family"
    t.boolean  "is_active",    default: true
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "registrants", force: true do |t|
    t.string   "email",      null: false
    t.string   "code",       null: false
    t.datetime "expires_at", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscribers", force: true do |t|
    t.string   "email",      null: false
    t.string   "code"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["article_id"], name: "index_tags_on_article_id", using: :btree
  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "username",                   null: false
    t.string   "email",                      null: false
    t.boolean  "is_admin",   default: false
    t.boolean  "is_active",  default: true
    t.string   "salt",                       null: false
    t.string   "fish",                       null: false
    t.string   "code"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "whub_admins", force: true do |t|
    t.string   "email"
    t.string   "salt"
    t.string   "fish"
    t.string   "code"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
