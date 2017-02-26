class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :nullify
  has_many :comments, dependent: :nullify

  before_validation :downcase_email
  before_save :full_name

  validates :first_name, :last_name, :email, presence: true
  validates :password, :password_confirmation, presence: true,
                                              #  length: { minimum: 6 },
                                               allow_nil: true
                                              
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, uniqueness: true,
                    format: VALID_EMAIL_REGEX

  def full_name
    "#{first_name} #{last_name}".strip.titleize
  end

  private

  def downcase_email
    self.email&.downcase!
  end

end
