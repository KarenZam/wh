class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :email, null: false, index: true
      t.string :code
      t.timestamp :expires_at

      t.timestamps
    end
  end
end
