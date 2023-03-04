class AddColumnPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :statr_at, :date
    add_column :posts, :end_at, :date
  end
end
