class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.text :caption
      t.integer :time_posted
      t.text :image_url
      t.text :location
      t.integer :author_id
      t.timestamps
    end
  end
end
