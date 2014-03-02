class CreateRegistrants < ActiveRecord::Migration
  def change
    create_table :registrants do |t|
      t.string :email, null: false
      t.string :code, null: false
      t.timestamp :expires_at, null: false

      t.timestamps
    end
  end
end
