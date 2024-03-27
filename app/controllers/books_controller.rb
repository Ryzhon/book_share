# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %i[show update destroy]

  # GET /books
  def index
    @books = Book.includes(:tags, :genre).all
    render json: @books.as_json(
      include: {
        tags: {
          only: %i[id name]
        },
        genre: {
          only: %i[id name]
        }
      }
    )
  end

  # GET /books/:isbn
  def show
    render json: @book.as_json(include: { tags: { only: %i[id name] }, genre: { only: %i[id name] } })
  end

  # POST /books
  def create
    @book = Book.new(book_params)
    if @book.save
      render json: @book.as_json(include: { tags: { only: %i[id name] },
                                            genre: {
                                              only: %i[id name]
                                            } }), status: :created
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      render json: @book.as_json(include: { tags: { only: %i[id name] }, genre: { only: %i[id name] } })
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/:isbn
  def destroy
    @book.destroy
    render json: { message: 'Book was successfully deleted.' }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    isbn = params[:id]
    @book = Book.find_by(isbn:)

    render json: { error: 'Book not found' }, status: :not_found unless @book
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.permit(:title, :author, :genre_id, :summary, :status, :image_url, :isbn, tag_ids: [])
  end
end
