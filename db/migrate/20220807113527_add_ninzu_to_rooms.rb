class AddNinzuToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :ninzu, :integer
  end
end
