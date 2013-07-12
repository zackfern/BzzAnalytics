class AddLastImportedToFilters < ActiveRecord::Migration
  def change
    add_column :filters, :last_imported, :datetime
  end
end
