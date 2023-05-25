class AddCommentToLists < ActiveRecord::Migration[7.0]
  def change
    add_column :lists, :comment, :text
  end
end
