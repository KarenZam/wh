class CreateAffiliations < ActiveRecord::Migration
  def change
    create_table :affiliations do |t|
      t.references :profile, index: true
      t.references :organization, index: true
      t.date :began_on, null: false
      t.date :ended_on
      t.boolean :is_active, default: true, index: true

      t.timestamps
    end
  end
end
