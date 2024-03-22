# frozen_string_literal: true

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token if Rails.env.development?
  protect_from_forgery with: :null_session, if: -> { request.format.json? }
end
