class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 4 }
  def self.authenticate_with_credentials (email,password)
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
