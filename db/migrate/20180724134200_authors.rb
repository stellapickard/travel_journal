class Authors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.integer :user_id
      t.string :user_name
      t.text :profile_picture
      t.text :bio
      t.text :trip_description
      t.timestamps
    end
  end
end
