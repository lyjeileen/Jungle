class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true, case_sensitive: false, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  validates :first_name, presence: true
  validates :last_name, presence: true
end
