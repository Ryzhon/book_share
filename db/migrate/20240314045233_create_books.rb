# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :genre_id
      t.text :summary
      t.string :status
      t.string :isbn
      t.string :imageUrl

      t.timestamps
    end
  end
end
