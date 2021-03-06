class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, index: true, null: false
      t.text :body, null: false
      t.string :blog_image
      t.string :slug, index: true, null: false
      t.boolean :is_archived, default: false
      t.references :user, index: true, null: false

      t.timestamps
    end
  end
end
