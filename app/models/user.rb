class User < ActiveRecord::Base
  attr_accessor :password
  validates :email, presence: true
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :phone, presence: true
  validates :password, confirmation: true
  before_save :encrypt_password

  has_many :posts
  has_many :comments

  def encrypt_password
    unless password.nil?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

end
