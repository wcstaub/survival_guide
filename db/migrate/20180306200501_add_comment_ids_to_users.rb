class AddCommentIdsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :comment_ids, :text
  end
end
