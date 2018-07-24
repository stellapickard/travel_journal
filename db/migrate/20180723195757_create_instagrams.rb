class CreateInstagrams < ActiveRecord::Migration[5.1]
  def change
    create_table :instagrams do |t|
      t.integer :post_date
      t.text :caption
      t.string :location
      t.integer :no_of_images
      t.text :image_url
      t.timestamps
    end
  end
end
