class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :slug
      t.string :name
      t.text :description
      t.string :pitch
      t.string :logo
      t.date :founded_on
      t.string :home_page

      t.timestamps
    end
  end
end
