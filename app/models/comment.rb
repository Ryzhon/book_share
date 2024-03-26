# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :user_id, uniqueness: { scope: :book_id }
end
