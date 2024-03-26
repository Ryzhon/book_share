# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment do
  let(:user) { create(:user) }
  let(:book) { create(:book) }

  it 'ユーザーは一つの本に複数のコメントをすることができないこと' do
    create(:comment, user:, book:)
    second_comment = build(:comment, user:, book:)
    expect(second_comment).not_to be_valid
  end

  it '違う二つの本にコメントをすることができること' do
    create(:comment, user:, book:)
    second_book = create(:book)
    second_book_comment = build(:comment, user:, book: second_book)
    expect(second_book_comment).to be_valid
  end

  it '違う二人のユーザーが同じ本にコメントできること' do
    create(:comment, user:, book:)
    second_user = create(:user)
    second_user_comment = build(:comment, user: second_user, book:)
    expect(second_user_comment).to be_valid
  end
end
