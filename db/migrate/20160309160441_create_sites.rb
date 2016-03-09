class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :color
    end
  end
end
