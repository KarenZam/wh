class CreateRegistrants < ActiveRecord::Migration
  def change
    create_table :registrants do |t|
      t.string :email
      t.boolean :is_startup, default: false
      t.string :code
      t.timestamp :expires_at

      t.timestamps
    end
  end
end
