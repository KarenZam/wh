class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :profile_type
      t.string :profile_name
      t.string :name_given
      t.string :name_family
      t.references :user, index: true

      t.timestamps
    end
  end
end
