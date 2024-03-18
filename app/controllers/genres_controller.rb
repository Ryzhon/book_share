# frozen_string_literal: true

class GenresController < ApplicationController
  before_action :set_genre, only: [:destroy]
  # GET /genres
  def index
    @genres = Genre.all
    render json: @genres
  end

  # POST /genres
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      render json: @genre, status: :created
    else
      render json: @genre.errors, status: :unprocessable_entity
    end
  end

  # DELETE /genres/:id
  def destroy
    @genre.destroy
    render json: { message: 'Genre was successfully deleted.' }
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def set_genre
    @genre = Genre.find(params[:id])
  end
end
