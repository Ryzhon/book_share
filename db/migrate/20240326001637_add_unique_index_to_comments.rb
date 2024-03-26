class AddUniqueIndexToComments < ActiveRecord::Migration[7.1]
  def change
    add_index :comments, [:user_id, :book_id], unique: true
  end
end
