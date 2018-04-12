class AddSolvedColumnToForumPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :forum_posts, :solved, :boolean, default: false
  end
end
