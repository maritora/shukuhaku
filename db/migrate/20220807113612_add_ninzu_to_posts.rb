class AddNinzuToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :ninzu, :integer
  end
end
