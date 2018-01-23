class User < ActiveRecord::Base
  attr_accessor :password

  has_many :posts
  has_one :image, as: :imageable, dependent: :destroy

  scope :adults, (-> { where('birthday <= ?', 18.years.from_now) })

  validates :password, confirmation: true, presence: true, length: {minimum: 8}, if: :new_record?
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
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
#  id            :integer         not null, primary key
#  first_name    :string
#  last_name     :string
#  username      :string
#  email         :string
#  birthday      :datetime
#  created_at    :datetime
#  updated_at    :datetime
#  password_hash :string
#  password_salt :string
#
