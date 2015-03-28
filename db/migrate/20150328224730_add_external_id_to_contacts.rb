class AddExternalIdToContacts < ActiveRecord::Migration
  def change
    add_column :chapters, :external_id, :integer
    add_index :chapters, :external_id, unique: true
  end
end
