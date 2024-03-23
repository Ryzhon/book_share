# frozen_string_literal: true

class UserSessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      render json: { message: 'Login successful', user: @user }, status: :ok
    else
      render json: { message: 'Login failed' }, status: :unauthorized
    end
  end

  def destroy
    logout
    render json: { message: 'Logged out' }, status: :ok
  end
end
