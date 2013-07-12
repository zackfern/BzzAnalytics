class CreateFilters < ActiveRecord::Migration
  def change
    create_table :filters do |t|
      t.string :name
      t.string :path
      t.string :web_property_id
      t.references :user, index: true

      t.timestamps
    end
  end
end
