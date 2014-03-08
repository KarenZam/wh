class CreateWhubAdmins < ActiveRecord::Migration
  def change
    create_table :whub_admins do |t|
      t.string :email
      t.string :salt
      t.string :fish
      t.string :code
      t.timestamp :expires_at

      t.timestamps
    end
  end
end
