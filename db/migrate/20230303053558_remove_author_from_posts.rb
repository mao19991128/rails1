class RemoveAuthorFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :statr_at, :date
  end
end
