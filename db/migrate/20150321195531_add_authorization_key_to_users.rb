class AddAuthorizationKeyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :authorization_key, :string
  end
end
