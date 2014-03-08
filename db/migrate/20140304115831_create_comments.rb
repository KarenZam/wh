class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.references :article, index: true
      t.references :comment, index: true
      t.references :user, index: true, null: false

      t.timestamps
    end
  end
end
