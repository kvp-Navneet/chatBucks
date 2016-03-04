class RemoveCachedvoteFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :cached_votes, :integer
  end
end
