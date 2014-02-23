class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :email
      t.string :subject
      t.string :body
      t.boolean :was_viewed, default: false

      t.timestamps
    end
  end
end
