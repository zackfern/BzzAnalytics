class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.references :filter, index: true
      t.string :path
      t.integer :pageviews

      t.timestamps
    end
  end
end
