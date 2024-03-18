# frozen_string_literal: true

class TagsController < ApplicationController
  before_action :set_tag, only: [:destroy]
  # GET /tags
  def index
    @tags = Tag.all
    render json: @tags
  end

  # POST /tags
  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      render json: @tag, status: :created
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @tag.destroy
    render json: { message: 'Tag was successfully deleted.' }
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end
end
