class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.attachment :image
      t.text :additional_information
      t.string :repo_url
      t.string :live_site
      t.integer :order

      t.timestamps null: false
    end
  end
end
