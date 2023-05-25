class AddPosterToLists < ActiveRecord::Migration[7.0]
  def change
    add_column :lists, :poster_url, :string
  end
end
