# frozen_string_literal: true

class UserSessionsController < ApplicationController
  skip_before_action :require_valid_token, only: :create
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      api_key = @user.activate
      @access_token = api_key.access_token
      render json: { message: 'Login successful', user: @user, access_token: api_key.access_token, expires_at: api_key.expires_at }, status: :ok
    else
      render json: { message: 'Login failed' }, status: :unauthorized
    end
  end

  def destroy
    access_token = request.headers[:HTTP_ACCESS_TOKEN]

    api_key = ApiKey.find_by(access_token:)
    return unless api_key

    user = User.find(api_key.user_id)
    user.inactivate

    render json: { message: 'Logged out' }, status: :ok
  end
end
