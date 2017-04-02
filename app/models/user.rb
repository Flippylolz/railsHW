class User < ActiveRecord::Base
  attr_accessible :birthday, :email, :first_name, :last_name, :password, :username

  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true
  validates :password, length: { minimum: 8 }

  has_many :posts
  has_many :images, as: :imageable

  scope :adults, -> { where('birthday >= ?', Date.today - 18.years) }

  def full_name
    "#{first_name} #{last_name}"
  end
end
# == Schema Information
#
# Table name: users
#
#  id         :integer(4)      not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  username   :string(255)
#  password   :string(255)
#  email      :string(255)
#  birthday   :datetime
#  created_at :datetime        not null
#  updated_at :datetime        not null
#
