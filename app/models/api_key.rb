# frozen_string_literal: true

class ApiKey < ApplicationRecord
  before_create :generate_access_token, :set_expiration, :set_active
  belongs_to :user

  def before_expired?
    DateTime.now < expires_at
  end

  def set_active
    self.active = true
  end

  def set_expiration
    self.expires_at = DateTime.now + 1
  end

  private

  def generate_access_token
    loop do
      self.access_token = SecureRandom.hex
      break unless self.class.exists?(access_token:)
    end
  end
end
