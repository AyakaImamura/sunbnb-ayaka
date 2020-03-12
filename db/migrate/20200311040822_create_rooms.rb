class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :name
      t.string :home_type
      t.string :room_type
      t.integer :guest_count
      t.integer :bedrooms_count
      t.integer :bathrooms_count
      t.float :price
      t.text :summary
      t.boolean :has_tv
      t.boolean :has_heating
      t.boolean :has_internet
      t.boolean :has_aircon
      t.boolean :has_kitchen
      t.string :address
      t.boolean :is_active

      t.timestamps
    end
  end
end
