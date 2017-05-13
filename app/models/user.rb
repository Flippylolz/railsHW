class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation,
                  :first_name, :last_name, :username, :birthday

  attr_accessor :password

  has_many :posts
  has_many :images, as: :imageable

  scope :adults, (-> { where('birthday <= ?', Date.today - 18.years) })

  validates_confirmation_of :password
  validates_presence_of :username, :email, :password
  validates_uniqueness_of :username, :email
  validates_length_of :password, minimum: 8
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  before_save :encrypt_password

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    user if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
  end

  private

  def encrypt_password # validates :password, presence: true
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
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
