class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :profile_name
      t.string :name_given
      t.string :name_family
      t.string :company_name
      t.string :position
      t.references :user

      t.timestamps
    end
  end
end
