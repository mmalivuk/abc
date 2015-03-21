class AddFieldsToChapters < ActiveRecord::Migration
  def change
    change_table :chapters do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.date :renewal_due
      t.timestamp :created_on
    end
  end
end
