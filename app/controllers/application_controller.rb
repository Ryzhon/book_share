# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :require_valid_token
  skip_before_action :verify_authenticity_token if Rails.env.development?
  protect_from_forgery with: :null_session, if: -> { request.format.json? }

  private

  def require_valid_token
    access_token = request.headers['HTTP_ACCESS_TOKEN']
    if access_token.blank?
      render json: { message: 'Access token is missing' }, status: :unauthorized
      return
    end

    return if User.login?(access_token)

    render json: { message: 'Access token is invalid' }, status: :unauthorized
  end
end
