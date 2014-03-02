class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :profile_type, index: true
      t.string :profile_name, index: true
      t.string :name_given
      t.string :name_family, index: true
      t.boolean :is_active, default: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
