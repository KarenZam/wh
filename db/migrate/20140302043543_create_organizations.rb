class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :slug, index: true
      t.string :name, index: true
      t.text :description
      t.string :pitch
      t.string :logo
      t.date :founded_on
      t.string :home_page
      t.boolean :is_active, default: true, index: true

      t.timestamps
    end
  end
end
