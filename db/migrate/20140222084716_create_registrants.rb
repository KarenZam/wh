class CreateRegistrants < ActiveRecord::Migration
  def change
    create_table :registrants do |t|
      t.string :email
      t.string :user_category, inclusion: { in: %w(startup talent intern cofounder) }, default: "talent"
      t.string :code
      t.timestamp :expires_at

      t.timestamps
    end
  end
end
