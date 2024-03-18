# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :book_tags, dependent: :destroy
  has_many :tags, through: :book_tags
  belongs_to :genre, optional: true
end
