class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :profile_type
      t.string :name_given
      t.string :name_family
      t.references :user

      t.timestamps
    end
  end
end
