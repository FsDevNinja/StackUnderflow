class AddForeignKeyToForumThreads < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :forum_posts, :forum_threads, on_delete: :cascade
  end
end
