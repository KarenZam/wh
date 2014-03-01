class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, uniqueness: true
      t.string :user_category, inclusion: { in: %w(startup talent intern cofounder) }, default: "talent"

      t.boolean :is_admin, default: false
      t.string :salt
      t.string :fish
      t.string :code, index: true
      t.timestamp :expires_at

      t.timestamps
    end
  end
end
