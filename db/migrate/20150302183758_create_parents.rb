class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.references :user, index: true
      t.string :api_key

      t.timestamps null: false
    end
    add_foreign_key :parents, :users
  end
end
