class Post < ActiveRecord::Base
  attr_accessible :body, :published_at, :title, :user_id
  has_many :images, as: :imageable
  belongs_to :user

  scope :published, -> { where('published_at IS NOT NULL') }
  validates :title, :body, presence: true

end
# == Schema Information
#
# Table name: posts
#
#  id           :integer(4)      not null, primary key
#  title        :string(255)
#  body         :text
#  published_at :datetime
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#  user_id      :integer(4)
#

