class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :room_id
      t.binary :room_image
      t.string :room_name
      t.string :room_info
      t.integer :room_price
      t.date :start
      t.date :end
      t.datetime :create_at

      t.timestamps
    end
  end
end
