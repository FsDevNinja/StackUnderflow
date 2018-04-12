class AddCategoryToForumThread < ActiveRecord::Migration[5.0]
  def change
    add_column :forum_threads, :category, :string, default: "general"
  end
end
