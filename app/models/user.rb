class User < ActiveRecord::Base
  attr_accessible :birthday, :email, :first_name, :last_name, :password, :password_confirmation, :username

  attr_accessor :password
  before_save :encrypt_password


  validates_confirmation_of :password
  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true
  validates :password, length: { minimum: 8 }
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  has_many :posts
  has_many :images, as: :imageable

  scope :adults, -> { where('birthday >= ?', Date.today - 18.years) }

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
# == Schema Information
#
# Table name: users
#
#  id            :integer(4)      not null, primary key
#  first_name    :string(255)
#  last_name     :string(255)
#  username      :string(255)
#  email         :string(255)     indexed
#  birthday      :datetime
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#  password_hash :string(255)
#  password_salt :string(255)
#

