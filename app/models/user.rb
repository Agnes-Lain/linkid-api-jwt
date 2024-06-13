class User < ApplicationRecord
  require "securerandom"

  has_secure_password

  validates :email, :password, :username, :user_status, presence: true
  validates :password, length: { in: 8..42 }
  validates :username, uniqueness: true
  validates :accepted_terms_of_service, acceptance: true
  validates :user_status, inclusion: { in: %w(active inactive archive),
    message: "%{value} is not a valid value" }

end
