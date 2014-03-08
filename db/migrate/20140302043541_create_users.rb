class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false, index: true
      t.string :email, null: false
      t.boolean :is_active, default: true, index: true
      t.string :salt, null: false
      t.string :fish, null: false
      t.string :code
      t.timestamp :expires_at

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
