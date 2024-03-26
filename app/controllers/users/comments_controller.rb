# frozen_string_literal: true

module Users
  class CommentsController < ApplicationController
    before_action :set_user, only: [:index]

    def index
      @comments = @user.comments
      render json: @comments
    end

    private

    def set_user
      @user = User.find(params[:user_id])
    end
  end
end
