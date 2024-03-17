# frozen_string_literal: true

class RenameImageUrlToImageUrlInBooks < ActiveRecord::Migration[7.1]
  def change
    rename_column :books, :imageUrl, :image_url
  end
end
