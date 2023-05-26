class CreateListComments < ActiveRecord::Migration[7.0]
  def change
    create_table :list_comments do |t|
      t.references :list, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
