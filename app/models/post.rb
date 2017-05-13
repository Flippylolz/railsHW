class Post < ActiveRecord::Base
  attr_accessible :body, :published_at, :title, :user_id, :images_attributes
  has_many :images, as: :imageable
  accepts_nested_attributes_for :images
  belongs_to :user

  scope :published, (-> { where('published_at IS NOT NULL') })
  scope :inverse, (-> { order('id DESC') })
  validates :title, :body, presence: true

  self.per_page = 10
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
