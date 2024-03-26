# frozen_string_literal: true

class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :api_keys, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: true

  def self.login?(access_token)
    api_key = ApiKey.find_by(access_token:)
    return false unless api_key&.before_expired? && api_key&.active

    find(api_key.user_id).present?
  end

  def activate
    return ApiKey.create(user_id: id) unless api_key

    unless api_key.active
      api_key.set_active
      api_key.save
    end

    unless api_key.before_expired?
      api_key.set_expiration
      api_key.save
    end

    api_key
  end

  def inactivate
    api_key.active = false
    api_key.save
  end

  private

  def api_key
    @api_key ||= ApiKey.find_by(user_id: id)
  end
end
