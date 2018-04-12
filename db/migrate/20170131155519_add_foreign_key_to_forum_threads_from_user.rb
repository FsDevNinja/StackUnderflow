class AddForeignKeyToForumThreadsFromUser < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :forum_threads, :users, on_delete: :cascade
  end
end
