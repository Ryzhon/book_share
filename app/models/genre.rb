# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :books, dependent: :destroy
end
