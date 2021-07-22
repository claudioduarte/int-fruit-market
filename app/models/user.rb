class User < ApplicationRecord
  # VALIDATIONS
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, length: { maximum: 75 }, uniqueness: { case_sensitive: false }, format: { with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i, message: 'A valid e-mail is required'}

  # TRANSFORM E-MAIL TO DOWNCASE
  before_save { email.downcase! }

  # GENERATE REMEMBER TOKEN
  before_create :create_remember_token

  # SSOCIATIONS
  has_one :vendor

  # BCRYPT (Generates password hash)
  has_secure_password

  private

  # CREATE REMEMBER TOKEN
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
