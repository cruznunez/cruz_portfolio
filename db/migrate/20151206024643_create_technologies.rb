class CreateTechnologies < ActiveRecord::Migration
  def change
    create_table :technologies do |t|
      t.string :name
      t.string :long_name
      t.string :link

      t.timestamps null: false
    end
  end
end
