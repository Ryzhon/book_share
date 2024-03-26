module Books
  class CommentsController < ApplicationController
    before_action :set_book

    def index
      @comments = @book.comments
      render json: @comments
    end

    def create
      @comment = Comment.new(
        user: current_user,
        book: @book,
        text: comment_params[:text]
      )

      if @comment.save
        render json: @comment, status: :created, location: [@book, @comment]
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end

    private

    def set_book
      @book = Book.find(params[:book_id])
    end

    def comment_params
      params.require(:comment).permit(:text)
    end
  end
end
