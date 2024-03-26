# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    user
    book
    text { 'Test Comment Text' }
  end
end
