class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :reservation, foreign_key: true
      t.references :room, foreign_key: true
      t.text :comment
      t.integer :star
      t.string :type
      t.references :guest, foreign_key: { to_table: :users }
      t.references :host, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
