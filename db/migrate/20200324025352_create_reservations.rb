class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.float :price_per_night
      t.float :total_price

      t.timestamps
    end
  end
end
