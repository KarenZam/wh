class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :email, null: false, index: true
      t.string :subject, null: false
      t.text :body, null: false
      t.references :user, index: true
      t.references :organization, index: true

      t.timestamps
    end
  end
end
