# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { 'リーダブルコード' }
    author { 'Dustin Boswell' }
    genre
    summary { 'Book summary.' }
    status { 'available' }
    isbn { '978-4-87311-565-8' }
    image_url { 'http://example.com/sample.jpg' }
  end
end
