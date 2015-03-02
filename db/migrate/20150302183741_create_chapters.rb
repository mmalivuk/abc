class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.references :user, index: true
      t.string :api_key

      t.timestamps null: false
    end
    add_foreign_key :chapters, :users
  end
end
