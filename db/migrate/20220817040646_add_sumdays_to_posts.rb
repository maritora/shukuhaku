class AddSumdaysToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :sumdays, :integer
    add_column :posts, :totalprice, :integer
  end
end
