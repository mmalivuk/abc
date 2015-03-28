class RenameColumnInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :authorization_key, :access_token
  end
end
