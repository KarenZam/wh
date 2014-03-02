class CreateAffiliations < ActiveRecord::Migration
  def change
    create_table :affiliations do |t|
      t.references :profile, index: true
      t.references :organization, index: true

      t.timestamps
    end
  end
end
