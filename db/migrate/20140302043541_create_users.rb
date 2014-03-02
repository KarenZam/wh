class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.boolean :is_admin, default: false
      t.string :salt
      t.string :fish
      t.string :code
      t.timestamp :expires_at

      t.timestamps
    end
  end
end
